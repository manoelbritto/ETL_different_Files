# Project Title
Extract, Transform, Load

# Prerequisites
Python, Pandas (Jupiter Notebook), SQLAlchemy

# coding style tests
print(query)
if query == []:
    city_one = City(name='Vancouver', country="Canada", state="ON")
    session.add(city_one)
    session.commit()
    
    engine.execute("delete FROM registercrime")
session.commit()
#new_customer_data_df.to_sql(name='customer_name', con=engine, if_exists='append', index=False)
df_crime_type.to_sql(name='crimestype', con=engine, if_exists='append', index=False)
session.commit()

session.rollback()

for index, row in renamed_Vancouver_df.iterrows():
    id_crime = session.query(CrimeType.id).filter(CrimeType.type == row["crimestype"]).first()
    year = row["year"]
    month = row["month"]
    day = row["day"]
    latitude = row["latitude"]
    longitude = row["longitude"]
    id_city = session.query(City.id).filter(City.name=='Vancouver').first()
    session.add(RegisterCrime(id_crime = id_crime, id_city= id_city, year=year, month=month, day=day, latitude=latitude, longitude=longitude))
    session.commit()
