DESTDIR=/usr/local/www/apache24/data/jeep
POSTS=blogposts/

index.html : toc.m4 index.html.m4 postlist.m4
	m4 -I ${POSTS} index.html.m4 > ${.TARGET} 

photos.html : photos.html.m4
	m4 -I ${POSTS} photos.html.m4 > ${.TARGET} 

links.html : links.html.m4
	m4 -I ${POSTS} links.html.m4 > ${.TARGET} 

spending.m4 : spending.html.m4
	./spendtotal.sh > spending.m4

spending.html : spending.html.m4 spending.m4
	m4 -I ${POSTS} spending.html.m4 > ${.TARGET} 

toc.m4 : ${POSTS}
	./gentoc.sh ${POSTS} > toc.m4

postlist.m4 : blogposts
	./postlist.sh > ${.TARGET}

install : index.html photos.html links.html spending.html
	install -m 0644 index.html photos.html links.html spending.html $(DESTDIR) 
	install -m 0644 styles.css $(DESTDIR) 
	install -m 0644 images/* $(DESTDIR)

clean :
	rm -f index.html photos.html links.html spending.html toc.m4 postlist.m4 spending.m4 *.bak ${POSTS}/*.bak

clobber : clean
