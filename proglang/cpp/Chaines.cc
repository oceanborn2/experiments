// chaines.cc - programme destine a demontrer les defauts de la concatenation
// avec une chaine C.

// Le parcours de la chaine est fait a chaque nouvelle concatenation ce qui
// devient rapidement impratiquable.

#include <sys/time.h>
#include <iostream.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

const int MAXN = 400000;

      // Alors, ca, c'est tres vilain !!!
      int N, L, A;
      unsigned long int nbmseconds;
      char * tmp, * str;


void Banner()
{
  cout << "CString - Programme de test des chaines C" << endl;
}

void Usage()
{
  cout << endl;
  cout << "  Usage:" << endl;
  cout << "         CString <nloop> [nstr] [naff]" << endl;
  cout << endl;
  cout << "  nloop: entier donnant le nombre de concatenations" << endl;
  cout << "  nstr : entier donnant la taille de la chaine a concatener (defaut = 10)" << endl;
  cout << "  naff : entier donnant la periodicite de l'affichage (en nombre de tours) (defaut = 1001) " << endl;
}

int GetTime()
{
#ifdef _LINUX_
  struct timeval tv;
  struct timezone tz;
  if (gettimeofday(&tv, NULL) == -1) 
    { 
	perror("gettimeofday");
	exit(-1);
    }
  return tv.tv_sec;
#else
  return -1;
#endif
  
}

void DisplayTime(unsigned long int& nbmseconds)
{
   int temp = GetTime();
   if (nbmseconds == 0) { nbmseconds = temp; }
   cout << temp - nbmseconds << " secondes ecoulees depuis la derniere mesure" << endl;
   nbmseconds = temp;
}


void GetParams(int argc, char *argv[])
{
  tmp = NULL; str = NULL;
  if (argc < 2)
    { 
      Usage();
      cout << "Il faut preciser une grandeur entre 1 et " << MAXN << endl;
      exit(1);
    }
    // Calcul des parametres du lancement
    // et allocation de la memoire necessaire au fonctionnement du programme
    N = atoi (argv[1]);
    L = 10; A = 1001;
    if (argc > 2) { L = atoi(argv[2]); }
    if (argc > 3) { A = atoi(argv[3]); }
}

void PrepareTest()
{
  // Preparation de la chaine a concatener a la chaine de destination
  int i;
  tmp = new char [ L*N+1 ];
  str = new char [ L+1 ];
  strcpy(str,"");
  for (i=0; i<L; i++) { strcat(str," "); }
  cout << "Pour verification, longueur de la chaine str : " << strlen(str) << endl << endl;
}

void CleanupTest()
{
  if (tmp != NULL) { delete [] tmp; tmp = NULL; }
  if (str != NULL) { delete [] str; str = NULL; }
}

void Test1()
{
  // 1er test : Remplissage par index
  cout << "Test1 : Remplissage de toute la zone de memoire sans concatenation en une seule boucle" << endl;
  nbmseconds = 0;
  for (int i=0; i<L*N; i++) tmp[i] = ' ';
  tmp[L*N] = 0;
  DisplayTime(nbmseconds);
  cout << "Pour verification, longueur de la chaine tmp : " << strlen(tmp) << endl << endl;
  cout << endl << endl;
}

void Test2()
{
  // 2eme test : Remplissage par memset
  cout << "Test2 : Remplissage de toute la zone de memoire par appel systeme 'memset'" << endl;
  nbmseconds = 0;
  memset(tmp, L*N, 32); 
  tmp[L*N] = 0;
  DisplayTime(nbmseconds);
  cout << "Pour verification, longueur de la chaine tmp : " << strlen(tmp) << endl << endl;
  cout << endl << endl;
}

void Test3()
{
  int i;
  nbmseconds = 0;
  // Verification des parametres - Si OK => Lancement
  if (N<MAXN)
     {
	cout << "Test3 : Concatenation avec strcat" << endl;
        strcpy(tmp,"");
	DisplayTime(nbmseconds);
	for (i = 0; i<N; i++)
	 {
	    strcat(tmp, str);
	    if (i % A == 0)
	    {
	      cout << i << ":" ;
       	      DisplayTime(nbmseconds);
	      }
	 }
	cout << "Derniere mesure : ";
	DisplayTime(nbmseconds);
      }
  cout << "Pour verification, longueur de la chaine tmp : " << strlen(tmp) << endl << endl;
}


int main(int argc, char *argv[])
{
  Banner();
  GetParams(argc, argv);
  PrepareTest();
  Test1();
  Test2();
  Test3();
  CleanupTest();
}










