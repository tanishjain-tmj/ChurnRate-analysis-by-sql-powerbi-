#Q1
select SubscriptionType, sum( case when ischurned = 1 then 1 else 0 end )as churned,
sum( case when ischurned = 0 then 1 else 0 end )as active from customerdata group by subscriptiontype; 

#Q2
select Subscriptiontype, gender , avg(feedbackscore) as avgfeedback from customerdata group by subscriptiontype, gender;

#Q3
select * from customerdata where totalsessions < 5 and feedbackscore < 5 ;

#Q4
select customerid , name from customerdata where datediff(curdate(),lastlogindate) > 60;

#Q5
select subscriptiontype , sum(ischurned)*100/count(*) as churnrate  from customerdata group by subscriptiontype; 

#Q6
select customerid, name,subscriptiondate, datediff(curdate(),subscriptiondate) as dayssubscribed from customerdata order by dayssubscribed desc limit 10;

#Q7
select case when age between 18 and 25 then '18-25'  when age between 26 and 35 then '26-35'
 when age between 36 and 45 then '36-45'  when age between 46 and 55 then '46-55'
 else '56+' end as agegroup, count(*) as totalcustomers,
 sum(ischurned) as churnedcustomers,
 sum(ischurned)*100/count(*) as churnrate 
 from customerdata group by agegroup;