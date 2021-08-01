predicates
    drawside(real,integer)
    

goal 
  graphics(2,1,0),
  drawside(5000,10).

    
clauses
  
   
   drawside(Length,0):-forward(Length).
  
   drawside(Length,Level):-
       Newlength = Length / 1.414,
       Newlevel = Level - 1, right(45),
       drawside(Newlength,Newlevel),left(90),
       drawside(NewLength,Newlevel),right(45).