sharon = User.new(username: "sharon", email: "sharon@gmail.com", password: "password")
sharon.save
s_med1 = Medicine.new(name: "Metformin", strength: "1000mg", doctor: "Physician", how_to_refill: "Rx Outreach", rx_number: 10997947, dose_number: 1, dose_instructions: "by mouth daily", number_in_bottle: 90)
s_med1.user_id = sharon.id
s_med1.save

scott = User.new(username: "scott", email: "@gmail.com", password: "hamburger")
scott.save
sc_med1 = Medicine.new(name: "Pen VK", strength: "500mg", doctor: "Haster", how_to_refill: "CVS", rx_number: 1644231, dose_number: 2, dose_instructions: "by mouth, 1 in am, 1 in pm", number_in_bottle: 60)
sc_med1.user_id = scott.id
sc_med1.save

brian = User.new(username: "brian", email: "brian@gmail.com", password: "hotdog")
brian.save
b_med1 = Medicine.new(name: "Lyrica", strength: "100mg", doctor: "Doctor", how_to_refill: "Hyvee Pharmacy", rx_number: 120997845, dose_number: 2, dose_instructions: "by mouth daily", number_in_bottle: 90)
b_med1.user_id = brian.id
b_med1.save
