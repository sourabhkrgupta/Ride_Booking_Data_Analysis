create database ola;

use ola;

# 1. Retrieve all successful bookings:
create view Successful_Bookings AS
select * from booking 
where booking_status = 'Success';

select * from Successful_Bookings;
-----------------------------------------------------------------------
# 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_rides
from booking
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;
----------------------------------------------------------------------------
# 3. Get the total number of cancelled rides by customers:
create view canceled_rides_by_customers as
SELECT COUNT(*) FROM booking
WHERE Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;
-------------------------------------------------------------------------------
# 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM booking
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;

select * from top_5_customers;
--------------------------------------------------------------------------------------
# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers as
SELECT COUNT(*) FROM booking 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from rides_canceled_by_drivers;
--------------------------------------------------------------------------------------------
# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
booking WHERE Vehicle_Type = 'Prime Sedan';

select * from max_min_driver_rating;
------------------------------------------------------------------------------------------
# 7. Retrieve all rides where payment was made using UPI:
create view upi_payment as
SELECT * FROM booking WHERE Payment_Method = 'UPI';

select * from upi_payment;
-------------------------------------------------------------------------------------------
# 8. Find the average customer rating per vehicle type:
create view avg_customer_rating_per_vehicle as
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) as avg_customer_rating 
FROM booking
GROUP BY Vehicle_Type;

select * from avg_customer_rating_per_vehicle;
------------------------------------------------------------------------------------------
# 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as
SELECT SUM(Booking_Value) as total_successful_value 
FROM booking
WHERE Booking_Status = 'Success';

select * from total_booking_value;
-------------------------------------------------------------------------------------------
# 10. List all incomplete rides along with the reason:
create view incomplete_rides_with_reason as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM booking
WHERE Incomplete_Rides ='Yes';

select * from incomplete_rides_with_reason;