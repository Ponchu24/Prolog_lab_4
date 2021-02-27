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

%17
lenght([_|T],Res):-lenght([_|T],0,Res).
lenght([],I,I):-!.
lenght([_|T],I,Res):-I1 is I+1,lenght(T,I1,Res).

%18_11
p18_11:-write("Kol-vo = "),read(N),read_list(N,List),p18_11(List),!.
p18_11([H|T]):-count([H|T],H,Kol),(Kol \= 1 -> del_all([H|T],H,Res),list_el_numb(Res,El,0);El is H),p18_11(El).
p18_11(El):-write("Result = "),write(El).

%18_12
sublist([H|T],N1,N2,Res):-sublist([H|T],N1,N2,0,[],Res).
sublist([],_,N2,I,Cur_res,Res):-I is N2+1,swap_list(Cur_res,Res),!.
sublist([_|_],_,N2,I,Cur_res,Res):-I is N2+1,swap_list(Cur_res,Res),!.
sublist([H|T],N1,N2,I,Cur_res,Res):-I1 is I+1,(I1=<N1 -> sublist(T,N1,N2,I1,Cur_res,Res);sublist(T,N1,N2,I1,[H|Cur_res],Res)).

max_list_down([H|T],Max):-max_list_down(T,Max,H),!.
max_list_down([],Max,Max):-!.
max_list_down([H|T],Max,Cur_max):-(H>Cur_max -> max_list_down(T,Max,H);max_list_down(T,Max,Cur_max)).

append1([],List2,List2).
append1([H|T1],List2,[H|T2]):-append1(T1,List2,T2).

swap_part([H|T],N1,N2,Res):-N1_1 is N1+1,N2_1 is N2-1,sublist([H|T],0,N1,SubStart),lenght([H|T],ListEnd),ListEnd1 is ListEnd-1,sublist([H|T],N2,ListEnd1,SubEnd),sublist([H|T],N1_1,N2_1,SubCenter),swap_list(SubCenter,SwapSubCenter),append1(SubStart,SwapSubCenter,Res1),append1(Res1,SubEnd,Res),!.

p18_12:-write("Kol-vo = "),read(N),read_list(N,List),p18_12(List).
p18_12([H|T]):-max_list_down([H|T],Max),min_list_down([H|T],Min),list_el_numb([H|T],Max,NumMax),list_el_numb([H|T],Min,NumMin),((NumMin is NumMax-1;NumMax is NumMin-1) -> p18_12_write([H|T]);(NumMin<NumMax -> swap_part([H|T],NumMin,NumMax,Res);swap_part([H|T],NumMax,NumMin,Res)),p18_12_write(Res)).
p18_12_write(Res):-write("Result = "),write(Res),!.

%18_21
p18_21:-write("Kol-vo = "),read(N),read_list(N,List),p18_21(List).
p18_21(List):-max_list_down(List,Max),list_el_numb(List,Max,Num),Num1 is Num+1,lenght(List,Lg),Lg1 is Lg-1,sublist(List,Num1,Lg1,Res),p18_21_write(Res).
p18_21_write(Res):-write("Result = "),write(Res),!.
