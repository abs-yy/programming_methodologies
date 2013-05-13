#include <stdio.h>
main()
{　
    　int c;
  　while(1){
    　　c = get_c();
    　　while(c == '/'){
      　　　c = get_c();
      　　　if(c == '*'){
	　　　　printf("/*");
	　　　　int done = 0;
	　　　　while(! done){
	  　　　　　c = get_c();
	  　　　　　printf("%c",c);
	  　　　　　while(c == '*'){
	    　　　　　　c = get_c();
	    　　　　　　printf("%c",c);
	    　　　　　　if(c == '/'){
	      　　　　　　　done = 1;
	      　　　　　　　c = get_c();
	      　　　　　　　break;
	    }
	  }
	}
      }
    }
  }
}

