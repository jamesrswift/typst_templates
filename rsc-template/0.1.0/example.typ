#import "rsc-template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: lorem(12),
  authors: (
    (name: "L. I. Dolor"),
    (name: "S. A. Consectetur"),
    (name: "A. E. Sed"),
  ),
  abstract: lorem(75),

  //journal: "Food Chemistry Advances",
  article_type: "Review Article",
  article_dates: (
    (type: "Received Date", date: "01/05/2023"),
    (type: "Revised Date", date: "02/05/2023"),
    (type: "Accepted Date", date: "03/05/2023")
  ),
  doi: "10.1016/j.focha.2023.100417",
)

= Introduction
#lorem(500)

= Methodology
#lorem(200)

== Materials
#lorem(20)

== Chemicals 
#lorem(50)

== Samples
#lorem(75)

== Methods
#lorem(250)

=== Measurement
#lorem(250)


= Results and Discussion
#lorem(1000)

= Conclusions
#lorem(75)

#set heading(numbering: none)
= Acknowledgements
#lorem(20)

= Conflicts of Interest
#lorem(20)

= References
#lorem(1000)