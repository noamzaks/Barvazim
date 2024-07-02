// Category: Forensics
#import "../../template.typ": writeup

#show: writeup.with(ctf: "BSides", exercise: "Skibidi", date: datetime(day: 29, month: 6, year: 2024))

Every docx file is a ZIP archive. After unzipping the `Skibidi.docx` file, we can go over the different files included.
Most seem uninteresting, however, the `img.xml` seems suspicious - why is an image an XML file? And the content is especially suspicious:

```xml
<root>
  <person
  firstname="QnNpZGVzVExWMjAyNHt3M19k"
  lastname="M2YzNXQzZF90aDNfc2sxYjFkaX0="
  city="Haifa"
  country="Israel"
  firstname2="QnNpZGVzVExWMjAyNHt3M19k"
  lastname2="M2YzNXQzZF90aDNfc2sxYjFkaX0="
  email="Ulrike.Leffen@yopmail.com"
  />
  <random>6</random>
  <random_float>89.838</random_float>
  <bool>true</bool>
  <date>1986-09-28</date>
  <regEx>helloooooooooooooooooooooooooooooooooooooooooooo world</regEx>
  <enum>generator</enum>
  <elt>Alyssa</elt><elt>Flory</elt><elt>Ulrike</elt><elt>Teriann</elt><elt>Reeba</elt>
  <Ulrike>
    <age>56</age>
  </Ulrike>
</root>
```

Well, the firstname, lastname, firstname2 and lastname2 appear to be Base64 data because they are only letters digits, and they end with the equal signs.

By now we have arrived at the solution of this challenge:

```python
>>> import base64
>>> base64.b64decode("QnNpZGVzVExWMjAyNHt3M19k") + base64.b64decode("M2YzNXQzZF90aDNfc2sxYjFkaX0=")
b'BsidesTLV2024{w3_d3f35t3d_th3_sk1b1di}'
```