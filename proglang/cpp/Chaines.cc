// chaines.cc - programme destiné a démontrer les défauts de la concaténation
// avec une chaîne C.

// Le parcours de la chaîne est fait à chaque nouvelle concaténation ce qui
// devient rapidement impraticable.

#include <sys/time.h>
#include <iostream.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

const int MAXN = 400000;

      // Alors, ça, c'est très vilain !!!
      int N, L, A;
      unsigned long int nbmseconds;
      char * tmp, * str;


void Banner()
{
  cout << "CString - Programme de test des chaînes C" << endl;
}

void Usage()
{
  cout << endl;
  cout << "  Usage:" << endl;
  cout << "         CString <nloop> [nstr] [naff]" << endl;
  cout << endl;
  cout << "  nloop: entier donnant le nombre de concaténations" << endl;
  cout << "  nstr : entier donnant la taille de la chaîne a concaténer (défaut = 10)" << endl;
  cout << "  naff : entier donnant la périodicité de l'affichage (en nombre de tours) (défaut = 1001) " << endl;
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
   cout << temp - nbmseconds << " secondes ecoulées depuis la dernière mesure" << endl;
   nbmseconds = temp;
}


void GetParams(int argc, char *argv[])
{
  tmp = NULL; str = NULL;
  if (argc < 2)
    { 
      Usage();
      cout << "Il faut préciser une grandeur entre 1 et " << MAXN << endl;
      exit(1);
    }
    // Calcul des paramètres du lancement
    // et allocation de la mémoire nécessaire au fonctionnement du programme
    N = atoi (argv[1]);
    L = 10; A = 1001;
    if (argc > 2) { L = atoi(argv[2]); }
    if (argc > 3) { A = atoi(argv[3]); }
}

void PrepareTest()
{
  // Préparation de la chaîne à concaténer à la chaîne de destination
  int i;
  tmp = new char [ L*N+1 ];
  str = new char [ L+1 ];
  strcpy(str,"");
  for (i=0; i<L; i++) { strcat(str," "); }
  cout << "Pour vérification, longueur de la chaîne str : " << strlen(str) << endl << endl;
}

void CleanupTest()
{
  if (tmp != NULL) { delete [] tmp; tmp = NULL; }
  if (str != NULL) { delete [] str; str = NULL; }
}

void Test1()
{
  // 1er test : Remplissage par index
  cout << "Test1 : Remplissage de toute la zone de mémoire sans concaténation et en une seule boucle" << endl;
  nbmseconds = 0;
  for (int i=0; i<L*N; i++) tmp[i] = ' ';
  tmp[L*N] = 0;
  DisplayTime(nbmseconds);
  cout << "Pour vérification, longueur de la chaîne tmp : " << strlen(tmp) << endl << endl;
  cout << endl << endl;
}

void Test2()
{
  // 2eme test : Remplissage par memset
  cout << "Test2 : Remplissage de toute la zone de mémoire par appel système 'memset'" << endl;
  nbmseconds = 0;
  memset(tmp, L*N, 32); 
  tmp[L*N] = 0;
  DisplayTime(nbmseconds);
  cout << "Pour vérification, longueur de la chaîne tmp : " << strlen(tmp) << endl << endl;
  cout << endl << endl;
}

void Test3()
{
  int i;
  nbmseconds = 0;
  // Vérification des paramètres - Si OK => Lancement
  if (N<MAXN)
     {
	cout << "Test3 : Concaténation avec strcat" << endl;
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
	cout << "Dernière mesure : ";
	DisplayTime(nbmseconds);
      }
  cout << "Pour vérification, longueur de la chaîne tmp : " << strlen(tmp) << endl << endl;
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




