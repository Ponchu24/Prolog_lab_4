%1
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).

write_list([]):-!.
write_list([H|T]):-write(H),nl,write_list(T).

%2
sum_list_down(L,S):-sum_list_down(L,0,S).
sum_list_down([],S,S):-!.
sum_list_down([H|T],Current_sum,Sum):-S1 is Current_sum+H,sum_list_down(T,S1,Sum).

pr4_2:-write("kol-vo: "),read(N),read_list(N,List),sum_list_down(List,Sum),write(Sum).

%3
sum_list_up([],0):-!.
sum_list_up([H|T],Sum):-sum_list_up(T,Sum1),Sum is H+Sum1.

%4
list_el_numb(List,El,Num):-list_el_numb(List,El,0,Num).
list_el_numb([H|_],H,Num,Num):-!.
list_el_numb([_|T],El,I,Num):-I1 is I+1,list_el_numb(T,El,I1,Num).

pr4_4:-write("kol-vo = "),read(N),read_list(N,List),write("Elem = "),read(El),list_el_numb(List,El,Num),write("Number = "),write(Num),write("."),!.
pr4_4:-write("Nope.").

%5
pr4_5:-write("kol-vo = "),read(N),read_list(N,List),write("Num = "),read(Num),list_el_numb(List,El,Num),write("Elem = "),write(El),write("."),!.
pr4_5:-write("Nope.").

%6
min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),(H<Min1 -> Min is H;Min is Min1).

%7
min_list_down([H|T],Min):-min_list_down(T,Min,H),!.
min_list_down([],Min,Min):-!.
min_list_down([H|T],Min,Cur_min):-(H<Cur_min -> min_list_down(T,Min,H);min_list_down(T,Min,Cur_min)).

%8
pr4_8:-write("kol-vo = "),read(N),read_list(N,List),min_list_down(List,Min),write("Min = "),write(Min).
