#lang racket

;; Bibliotecas
(require xml net/url)
(require web-server/dispatch)
(require web-server/servlet-env)
(require web-server/http/xexpr)	

(define-values (servidor blog-url)
    (dispatch-rules
     [("pagina_inicial") pi-function]
     [("fibonacci" (integer-arg)) fibonacci-function]
     [("fatorial" (integer-arg)) fatorial-function]
     [("inverte" (string-arg)) inverte-function]
     [("ordenacao" (string-arg)) ordenacao-function]
     [("membro" (integer-arg) (string-arg)) membro-function]
     [("uniao" (string-arg) (string-arg)) uniao-function]
     [("intersecao" (string-arg) (string-arg)) intersecao-function]
     [else page-error]))

(define (intersecao-function request value_a value_b) (response/xexpr `(html 
                                                            (head (title "Função Intersecção"))
                                                            (body
                                                             (h2, "Trabalho de Linguagens de Programação")
                                                             (p, "Execução da função 'intersecção' (lista & lista) com o(s) parâmetro(s) ", value_a, " e ", value_b ".")
                                                             (p, "Resultado: ", (intersecao value_a value_b)))
                                                            )))

(define (intersecao value_a value_b) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/intersecao.rkt " value_a " " value_b)))) "\n")) 
                              (first result)) ;; Alterar caminhos acima

(define (uniao-function request value_a value_b) (response/xexpr `(html 
                                                            (head (title "Função União"))
                                                            (body
                                                             (h2, "Trabalho de Linguagens de Programação")
                                                             (p, "Execução da função 'união' (lista & lista) com o(s) parâmetro(s) ", value_a, " e ", value_b ".")
                                                             (p, "Resultado: ", (uniao value_a value_b)))
                                                            )))

(define (uniao value_a value_b) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/uniao.rkt " value_a " " value_b)))) "\n")) 
                              (first result)) ;; Alterar caminhos acima

(define (membro-function request value_a value_b) (response/xexpr `(html 
                                                            (head (title "Função Membro"))
                                                            (body
                                                             (h2, "Trabalho de Linguagens de Programação")
                                                             (p, "Execução da função 'membro' (variável & lista) com o(s) parâmetro(s) ", (number->string value_a), " e ", value_b ".")
                                                             (p, "Resultado: ", (membro value_a value_b)))
                                                            )))
(define (membro value_a value_b) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/membro.rkt " (number->string value_a) " " value_b)))) "\n")) 
                              (first result)) ;; Alterar caminhos acima

(define (ordenacao-function request value) (response/xexpr `(html 
                                                            (head (title "Função Ordena"))
                                                            (body
                                                             (h2, "Trabalho de Linguagens de Programação")
                                                             (p, "Execução da função 'ordena' (lista) com o(s) parâmetro(s) ", value, ".")
                                                             (p, "Resultado: ", (ordena value)))
                                                            )))

(define (ordena value) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/ordenacao.rkt " value)))) "\n")) 
                              (first result)) ;; Alterar caminhos acima

(define (inverte-function request value) (response/xexpr `(html 
                                                            (head (title "Função Inverte"))
                                                            (body
                                                             (h2, "Trabalho de Linguagens de Programação")
                                                             (p, "Execução da função 'inverte' (lista) com o(s) parâmetro(s) ", value, ".")
                                                             (p, "Resultado: ", (inverte value)))
                                                            )))
(define (inverte value) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/inverte.rkt " value)))) "\n")) 
                              (first result)) ;; Alterar caminhos acima

(define (fibonacci-function request value) (response/xexpr `(html 
                                                             (head (title "Função Fibonacci")
                                                              (body
                                                               (h2, "Trabalho de Linguagens de Programação")
                                                               (p, "Execução da função 'fibonacci' com o(s) parâmetro(s) ", (number->string value), ".")
                                                               (p, "Resultado: ", (number->string(fibonacci value)))
                                                               )))))

(define (fibonacci value) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/fibonacci.rkt " (number->string value))))) "\n")) 
                              (string->number (first result))) ;; Alterar caminhos acima

(define (fatorial-function request value) (response/xexpr `(html 
                                                             (head (title "Função Fatorial")
                                                              (body
                                                               (h2, "Trabalho de Linguagens de Programação")
                                                               (p, "Execução da função 'fatorial' com o(s) parâmetro(s) ", (number->string value), ".")
                                                               (p, "Resultado: ", (number->string(fatorial value)))
                                                               )))))

(define (fatorial value) (define result 
                            (string-split 
                             (with-output-to-string 
                              (λ() (system (string-append "racket ~/Documentos/apps/apps/fatorial.rkt " (number->string value))))) "\n")) 
                              (string->number (first result))) ;; Alterar caminhos acima

(define (page-error request) (response/xexpr `(html 
                                                  (head (title "Página não encontrada!"))
                                                  (body
                                                   (p, "A página que você procura não existe :(!")
                                                   (a ((href "http://localhost:8080/pagina_inicial")) "Volta à página inicial?")
                                                   ))))

(define (pi-function request) (response/xexpr `(html 
                                                  (head (title "Página inicial!"))
                                                  (body
                                                   (h2, "Trabalho de Linguagens de Programação")
                                                   (p, "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*")
                                                   (p, "Aluno: Luiz Felipe F. Dias (RA: 1552309)")
                                                   (p, "Professor: Rodrigo Hubner")
                                                   (p, "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*")
                                                   (div ((class "post")) "Funções disponíveis: " 
                                                        (a ((href "http://localhost:8080/fibonacci/10")) "Fibonacci") " , "
                                                        (a ((href "http://localhost:8080/fatorial/10")) "Fatorial") " , "
                                                        (a ((href "http://localhost:8080/inverte/10,20,30,40,50")) "Inverte") " , "
                                                        (a ((href "http://localhost:8080/ordenacao/20,15,30,10,60")) "Ordena") " , "
                                                        (a ((href "http://localhost:8080/membro/50/10,40,50,20")) "Membro") " , "
                                                        (a ((href "http://localhost:8080/uniao/10,20,30,40/50,60,70,80")) "Uniao") " , "
                                                        (a ((href "http://localhost:8080/intersecao/10,20,30,40/10,60,40,50")) "Intersecção")
                                                        )))))

(serve/servlet servidor
               #:port 8080
               #:servlet-path "/pagina_inicial"
               #:servlet-regexp #rx".*")
