(use binary.pack)

(define (main args)
  (define (main-loop)
    (let ((line (read-line)))
      (cond ((not (eof-object? line))
             (let ((x (string->number line)))
               (cond ((not (eqv? x #f))
                      (display (fast-inv-sqrt (* 1.0 x)))
                      (newline))))
             (main-loop)))))
  (main-loop)
  0)

(define (fast-inv-sqrt x)
  (let* ((i (car (unpack "l" :from-string (pack "f" (list x) :to-string? #t))))
         (i (- #x5f3759df (ash i -1)))
         (y (car (unpack "f" :from-string (pack "l" (list i) :to-string? #t)))))
    (* y (- 1.5 (* 0.5 x y y)))))