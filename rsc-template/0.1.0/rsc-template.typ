#let LARGE = text.with(size: 15pt)
#let Large = text.with(size: 12pt)
#let large = text.with(size: 10pt)
#let normalSize = text.with(size: 9pt)
#let footnoteSize = text.with(size: 7pt)

#let create_dates(article_dates) = {
  return table(
    inset: 0pt,
    row-gutter: 0.15cm,
    stroke: none,
    columns: (1fr, 1fr),
    ..article_dates.map( entry =>{
      return (
        footnoteSize[#entry.type:],
        footnoteSize[#entry.date]
      )
    }).flatten()
  )
}

#let create_manuscript_information_left(article_dates, doi) = { 
  return align(bottom)[
    #create_dates(article_dates)
    #footnoteSize[DOI: #doi]
  ]
}

#let create_manuscript_information_right(title, authors, abstract) = { 
  return [
    #block(LARGE(weight:500, title))
    #v(0.6cm, weak: true)#authors.map(author=>author.name).join(", ")
    #v(1.618em, weak: true)
    #par(justify: true)[#abstract]
  ]
}

#let pageCount() = locate( loc => [#counter(page).final(loc).at(0)] )

#let project(
  title: [],
  title_string: "",
  authors: (),
  abstract: [],
  
  journal: "Journal Name",
  article_type: "Article Type",
  article_dates: (),
  doi: "",
  
  keywords: [],
  year: 2023,
  volume: 3,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title_string)
  set page(
    paper: "us-letter",
    margin: (left: 10mm, right: 10mm, top: 12mm, bottom: 15mm),
    numbering: "1",
    number-align: end,
    footer: locate( loc => [
      #if calc.even(loc.page()) [
        #align(left)[
          #counter(page).display()#h(0.75em)| #h(1em) _ #journal _, #year, *#volume*, 1---#pageCount()
        ]
      ] else [
        #align(right)[
          _ #journal _, #year, *#volume*, 1---#pageCount() #h(1em)|#h(0.75em)#counter(page).display()
        ]
      ]
    ])
  )
  set text(font: "Droid Sans", lang: "en", size:9pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  //show par: set block(above: 0.75cm, below: 0.8cm)

  show heading: set block(above: 1.4em, below: 0.8em)
  show heading: set text(size: 12pt)
  set heading(numbering: "1.1")
  //set par(leading: 0.58em)

  v(1.2em)
  // Journal Name
  block( inset: 0.2cm,text(weight: 200, 28pt, journal))
 
  // Article type
  block(fill: rgb(167,195,212), text(weight: 200, 24pt, article_type ,fill: white), width: 100% , inset: 10pt, radius: 2pt)

  // Manuscript Information
  pad(
    top: 0.3em, bottom: 0.3cm,
    x: 0em,
    grid(
      columns: (1.4fr,5fr),
      gutter: 0em,
      create_manuscript_information_left(article_dates, doi),
      create_manuscript_information_right(title, authors, abstract)
    )
  )



  line(length: 100%, stroke:0.5pt)

  v(0.8em)

  // Main body.
  set par(justify: true, first-line-indent: 0.45cm);
  show par: set block(above: 0pt, below: 0.7em,)
  show: columns.with(2, gutter: 1.618em)
  body
}