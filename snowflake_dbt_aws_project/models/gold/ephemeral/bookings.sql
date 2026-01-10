{{
    config(
        materialized = 'ephemeral',
    )
}}

With bookings as (
    Select Booking_ID, Booking_Date, Booking_Status, CREATED_AT
    From {{ ref ('obt')}}
)
Select* from bookings