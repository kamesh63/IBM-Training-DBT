select * from ref('int_partsupplier_statistics')
where
round(int_val_usd, 0) != round(int_val_eur /0.86,0)