# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#MedicalHistory.delete_all 
#Dependent.delete_all 


History.delete_all 
Dependent.delete_all 
User.delete_all 

user1 = User.create({
  name: "Ramachandran",
  email: "ramachandran.kulo@gmail.com",
  contact: "1234567890",
  country: "India",
  dob: 20.years.ago,
  password_digest: BCrypt::Password.create('123456')
})


dep1 = Dependent.create!({
  user: user1,
  relationship: "Mother",
  name: "Rams mother",
  email: "tm@test.com",
  contact: "4312567897",
  blood_group: "B+",
  dob: 50.years.ago,
  weight: 60,
  height: 145
})

dep2 = Dependent.create!({
  user: user1,
  relationship: "Father",
  name: "Toms Father",
  email: "tf@test.com",
  contact: "3312567897",
  blood_group: "A+",
  dob: 52.years.ago,
  weight: 65,
  height: 155
})


# MedicalHistory.create!({
#   user: user1,
#   illness: "Fever",
#   drname: "Dr. Strange",
#   medicine: "Paracetomol",
#   startdate: 2.days.ago.to_date,
#   enddate: 10.days.from_now,
#   dosage_amount: "1 dosage",
#   dosage_frequency: "daily-twice",
#   dosage_time: "2pm",
#   email_notify: true
# })

History.create!({
  user: user1,
  illness: "Fever",
  doctor: "Dr. Strange",
  medicines: "Paracetomol",
  start_date: 10.days.ago.to_date,
  # enddate: DateTime.now.prev_day.to_date,
  end_date: DateTime.now.to_date,
  dosage_amount: 1,
  dosage_frequency: 2,
  notification: true
})

History.create!({
  user: user1,
  illness: "Fever",
  doctor: "Dr. Strange",
  medicines: "Crocin",
  start_date: 10.days.ago.to_date,
  end_date: DateTime.now.to_date,
  dosage_amount: 1,
  dosage_frequency: 2,
  notification: true
})


History.create!({
  user: user1,
  illness: "Fever",
  doctor: "Dr. Strange",
  medicines: "Paracetomol",
  start_date: DateTime.now.next.to_date,
  end_date: 4.days.from_now.to_date,
  dosage_amount: 1,
  dosage_frequency: 2,
  notification: true
})


History.create!({
  user: user1,
  dependent: dep1,
  illness: "Cough",
  doctor: "Dr. Iron",
  medicines: "Tablet",
  start_date: DateTime.now,
  end_date: 12.days.from_now,
  dosage_amount: 2,
  dosage_frequency: 2,
  notification: true
})

History.create!({
  user: user1,
  dependent: dep2,
  illness: "Sore Throat",
  doctor: "Dr. Superman",
  medicines: "Syrup",
  start_date: 10.days.ago.to_date,
  end_date: DateTime.now.prev_day.to_date,
  dosage_amount: 2,
  dosage_frequency: 3,
  notification: true
})

History.create!({
  user: user1,
  dependent: dep2,
  illness: "Joint Pain",
  doctor: "Dr. Superman",
  medicines: "Iodex",
  start_date: DateTime.now.next.to_date,
  end_date: 4.days.from_now.to_date,
  dosage_amount: 2,
  dosage_frequency: 3,
  notification: true
})