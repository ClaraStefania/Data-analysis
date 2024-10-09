### **_Metode numerice - Tema 1 - README_**

##### _Tema realizata de Diaconescu Stefania Clara, 313 CA, Anul 1, 2023 - 2024_

### **Detalii legate de implementare**

### _Task-ul 1 - Detectia anomaliilor_

   Scopul problemei este de a detecta anomalii in seturile de date furnizate,
mai exact un subset care nu se potriveste cu intreg setul de date.

1) estimate_gaussian()
- functia determina media si varianta pntru datasetul dat
- sunt initializate variabilele si se calculeaza vectorul de medii mean_value, 
fiecare element reprezentand suma de pe linia cu indicele respectiv, impartita
la numarul de elemente
- se construieste matricea de varianta, fiecare element fiind suma produselor
diferentelor intre elementele de pe linia cu indicele respectiv si valoarea
corespunzatoare din vectorul de medii. Aceasta suma este impartita la numarul
de elemente pentru a obtine varianta

2) gaussian_distribution()
- functia calculeaza densitatea de probabilitate pentru datasetul dat
- se initailizeaza variabilele, se calculeaza determinantul matricei de
varianta folosind functia det(), necesar pentru formula densitatii de
probabilitate, si inversa matricei de varianta cu ajutorul functiei inv()
- pentru fiecare linie din matrice se calculeaza diferenta dintre punctul de
date si vectorul de medii
- este aflat exponentul si se caculeaza densitatea de probabilitate pentru
fiecare punct de date folosind formula gaussiana, stocata ulterior in vectorul
probability

3) gaussian_distribution()
- functia urmareste exact acelasi algoritm ca gaussian_distribution(), vectorul
rezultat fiind de aceasta data un vector coloana

4) check_predictions()
- functia evalueaza calitatea predictiilor, calculand cate sunt fals pozitive,
fals negative sau adevarat pozitive
- sunt initializate cu 0
- daca predictia si adevarul sunt 1, este incrementat true_pozitives
- daca predictia e 1 si adevarul e 0, este incrementat false_pozitives
- daca predictia e 0 si adevarul e 1, este incrementat false_negatives

5) metrics()
- functia calculeaza precision, recall si F1 folosind formulele specifice

6) optimal_threshold()
- functia determina cel mai bun prag pentru selectarea outlierilor
- sunt calculate atat minimul si maximul din vectorul de probabilitati, cat si
pasul
- pentru fiecare epsilon se stabileste predictia. Sunt apelate functiile
check_predictions() (pentru a calcula false_pozitives, false_negatives si
true_pozitives) si metrics() (pentru a calcula precision, recall si F1)
- la final se actualizeaza valorile optime daca este cazul

### _Task-ul 2 - Kernel Regression_

   Scopul problemei este de a face predictii cat mai precise prin
implementarea metodelor numerice asociate algoritmului Kernel Regression.

1) split_dataset()
- functia imparte setul de date pentru antrenare si testare
- sunt calculate dimensiunile seturilor de date de antrenare si de testare,
in fiecare vector/matrice fiind copiate datele corespunzatoare (primele
nr_train_data in X_train si y_train, iar restul in X_pred si y_pred)

2) linear_kernel(), polynomial_kernel(), gaussian_kernel
- functiile aplica formulele specifice fiecarui tip de kernel (liniar/ 
polinomial/ gaussian)

3) build_kernel()
- functia contruieste matricea de kernel-uri
- se stabilesc dimensiunile si se construieste matricea kernel-urilor,
apelandu-se functia de kernel data

4) cholesky()
- functia este utilizata pentru descompunerea LU a unei matrice prin metoda
Cholesky
- este initializata matricea L cu 0 
- elementele de pe diaonala principala si cele de sub diagonala principala
sunt calculate folosindu-se formulele specifice algoritmului, L fiind o
matrice lower

5) get_lower_inverse()
- functia este utilizata pentru a inversa o matrice lower
- este initializata inversa cu matricea identitate
- se calculeaza fiecare element, iar la final randurile se impart la termenul
corespunzator aflat pe diagonala principala

6) get_prediction_params()
- functia returneaza vectorul coloana ce contine estimari ale parametrilor
folositi la evaluare cu ajutorul functiei cholesky()

7) conjugate_gradient()
- functia implementeaza un algoritm pentru metoda gradientului conjugat
- se calculeaza reziduul initial si se initializeaza vectorii
- cat timp numarul de iteratii este mai mic decat numarul maxim de iteratii
si norma la patrat a reziduului este mai mare decat toleranta, se calculeaza
pasul tk, reziduul rk si sk, sunt actualizate solutia si vectorii r si v si e
incrementat numarul de iteratii

8) get_prediction_params_iterative()
- functia returneaza vectorul coloana ce contine estimari ale parametrilor
folositi la evaluare cu ajutorul functiei conjugate_gradient()

9) eval_value()
- functia calculeaza estimarea produsa de model
- variabila pred va stoca valoarea estimata a functiei, adunandu-se de fiecare
data contributia elementelor din X la estimarea valorii 

### _Task-ul 2 - Kernel Regression_

   Scopul problemei este acela de realiza un mini-AI bazat pe lanturi Markov
care poate genera un text pe baza unui fisier de input.

1) distinct_words()
- functia cauta cuvintele unice pe care le sorteaza

2)  k_secv()
- functia formeaza k-secventele dintr-un vector dat
- k-secventele (formate din k elemente consecutive) se vor stoca intr-o
variabila de tip cell array

3) distinct_k_secv()
- functia cauta k-secventele unice pe care le sorteaza

4) word_idx()
- functia asociaza fiecarui cuvant cate un indice, folosindu-se de un 
dictionar

5) k_secv_idx()
- functia asociaza fiecarei secvente cate un indice, folosindu-se de un 
dictionar

6) stochastic_matrix()
- functia creeaza matricea stochastica, folosind-se de seturile de cuvinte si
secvente
- sunt initializate variabilele
- la fiecare iteratie a for-ului (de la 1 pana la numarul de cuvinte initiale -
numarul de cuvinte ce formeaza o k-secventa) sunt luate secventa de la indicele
i si cuvantul aflat dupa secevnta
- se cauta indicii cuvintelor si este incrementat elementul din matrice aflat
la indicii respectivi

7) sample_next_word()
- functia intoarce probabilitatile aferente ultimei k-secvente din text
- este extrasa k-secventa, i se gaseste indexul si este returnata linia
din matricea stochastica corespunzatoare indicelui

8) sample_n_words()
- functia genereaza n cuvinte pornind de la textul dat
- pentru fiecare iteratie se calculeaza probabilitatile si este generat un
cuvant prin apelarea functiei prob_choos(), care se adauga la finalul textului
generat
