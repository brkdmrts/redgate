CREATE OR REPLACE TRIGGER scott.after_ins_upd_on_emp
before insert or update
on scott.emp
for each row

begin
   :new.ename := upper(:new.ename);
end;
/