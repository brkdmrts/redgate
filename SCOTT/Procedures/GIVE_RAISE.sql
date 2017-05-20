CREATE OR REPLACE procedure scott.give_raise (
    p_deptno in number,
    p_raise_percent in number )
as
begin
   update emp set sal = sal + (sal * p_raise_percent * .01)
   where deptno = p_deptno;

   commit;
end give_raise;
/