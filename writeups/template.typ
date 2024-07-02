#let MONTHS = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

#let writeup(ctf: "", exercise: "", date: datetime.today(), body) = {
  set document(author: "Team Barvazim", title: exercise, date: date)
  set page(margin: 1.2cm, footer: [
    #set align(center)
    #sym.copyright _Team Barvazim #text(blue)[at] #ctf #h(1fr) #MONTHS.at(date.month() - 1) #date.day(), #date.year()_
  ])

  [
    = #box(height: 12pt, image("../resources/duck.svg")) #exercise
  ]
  
  body
}