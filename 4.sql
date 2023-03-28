

-- 第三题
    -- 首先查出来“操作系统”对应的课程好 
select Cno from Course where Cname = '操作系统'; 
    -- 找出选择了“操作系统”这门课的的学生的学号
select SC.Sno from (select Cno from Course where Cname = '操作系统') num join SC on sc.Cno = num.Cno;
    --找出学号对应的姓名和成绩
select S.Sname, SC.Gradefrom (select Cno from Course where Cname = '操作系统') num join SC on sc.Cno = num.Cno join Student S on S.Sno = SC.Sno;

-- 第四题
    -- 首先找到选课人数不足四人的课程号
select Cno '课程号', count(Cno) '选课人数' from SC group by Cno having count(Cno) < 4;

/*-- 第五题
    -- 首先查询出 有先行课的课程名和先行课的课程号
select Cname, Cpno from Course where Cpno is not null;
    -- 再查出先行课还有先行课的课程
select temp.Cname '课程名', Course.Cpno '先行课程名' from (select Cname, Cpno from Course where Cpno is not null) temp join Course on temp.Cpno = Course.Cno and Course.Cpno is not null;
    -- 最后再将先先行课程的先行课程的课程名找到
select temp2.name '课程名', Course.Cname '先行课程名' from (select temp.Cname name, Course.Cpno ppname from (select Cname, Cpno from Course where Cpno is not null)
 temp join Course on temp.Cpno = Course.Cno and Course.Cpno is not null) temp2 join Course on Course.Cno = temp2.ppname;*/

 -- 第五题
select C1.Cname, C2.Cpno from Course C1 join Course C2 on C1.Cpno = C2.Cno and C2.Cpno is not null;

select temp.name, Course.Cname from (select C1.Cname name, C2.Cpno ppname from Course C1 join Course C2 on C1.Cpno = C2.Cno and C2.Cpno is not null)
 temp join Course on Course.Cno = temp.ppname;
 
-- 第六题
select S.*, SC.* from Student S left join SC on S.Sno = SC.Sno;

