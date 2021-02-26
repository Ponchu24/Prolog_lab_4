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

%9
in_list([H|_],H):-!.
in_list([_|T],El):-in_list(T,El).

%10
swap_list([H|T],Res_list):-swap_list([H|T],[],Res_list).
swap_list([],Cur_list,Cur_list):-!.
swap_list([H|T],Cur_list,Res_list):-swap_list(T,[H|Cur_list],Res_list).

%11
p(Sublist,List):-p(Sublist,Sublist,List).
p(_,[],_):-!.
p(_,Sublist,List):-Sublist=List,!.
p([SH|ST],[Cur_SH|Cur_ST],[LH|LT]):-(Cur_SH=LH -> p([SH|ST],Cur_ST,LT);SH=Cur_SH,p([SH|ST],[Cur_SH|ST],LT)).

%12
del_num([_|T],0,T):-!.
del_num([H|T],N,[H|T1]):-N1 is N-1,del_num(T,N1,T1).

%13
del_all([],_,[]):-!.
del_all([H|T],El,[H|T1]):-H\=El,del_all(T,El,T1),!.
del_all([_|T],El,T1):-del_all(T,El,T1).

%14
only_one([]):-!.
only_one([H|T]):-del_num([H|T],0,Res),not(in_list(Res,H)),only_one(Res).

%15
make_only_one([],[]):-!.
make_only_one([H|T],[H|T1]):-del_all([H|T],H,Res1),make_only_one(Res1,T1).

%16
count([H|T],El,Res):-count([H|T],El,0,Res),!.
count([],_,I,I):-!.
count([H|T],El,I,Res):-(H\=El -> count(T,El,I,Res);I1 is I+1,count(T,El,I1,Res)).

