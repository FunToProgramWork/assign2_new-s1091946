void setup() {
	size(640, 480, P2D);
	// Enter Your Setup Code Here
}

void draw() {
	ArrayList diskList;
ArrayList fromList;
ArrayList toList;
boolean nstop = false;
int speed =200;

int[] posx;
int[] posy;
int[] dsize;
int[] py;

void keyPressed() {
  nstop=!nstop;
}

void setup() {
  size(500, 500);

  diskList = new ArrayList();
  fromList = new ArrayList();
  toList = new ArrayList();
  hanoi(3, 0, 1, 2);

  posx = new int[3];
  posy = new int[3];
  dsize= new int[3];
  
  py = new int[3];
  py[0] = 30;
  py[1] =0;
  py[2] =0;

  for ( int i = 0; i < 3; i++)
  {
    posx[i] = 100;
    posy[i]= 400-i*10;
    dsize[i] = 10*(3-i);
  }

  print(diskList);
  print(fromList);
  print(toList);
}

int n = -1;
int index=-1;

void ani(int k, int nframe) {

  int disk =3-(int) diskList.get(k);
  int from =(int) fromList.get(k);
  int to = (int)toList.get(k);
  fill(0);
  text(disk+","+from+","+to, 100, 100);

  int step = nframe;
  if ( nframe > speed/2)
    step = speed- nframe;

  //rect(, 400-step, 10*(disk) , 10);

  posx[disk] =100+ ((speed-nframe)*from*100 +(nframe)* to*100)/speed;
  posy[disk]= 400-step - ((speed-nframe)*py[from] + nframe* py[to])/speed     ;

  for ( int i = 0; i < 3; i ++)
  {
    rect(posx[i] +45- dsize[i]/2 , posy[i], dsize[i], 10);
  }
}

void draw() {

  if ( nstop)
    return;
  background(255);

  if ( n<0) {

    index++;
    if ( index >= diskList.size()) {
      index =0;

      py[0] = 30;
      py[1] =0;
      py[2] =0;

      for ( int i = 0; i < 3; i++)
      {
        posx[i] = 100;
        posy[i]= 400-i*10;
        dsize[i] = 10*(3-i);
      }

      background(255);
    }

    n++;
  } else
  {

 

    if ( n < speed) {

 

      fill(255, 0, 0);
      for ( int i = 0; i < 3; i++) {
        rect( 100+ i * 100, 410, 80, 10);
      }
      ani( index, n);
      n++;
    } else
    {
      n=-1;

      int from =(int) fromList.get(index);
      int to = (int)toList.get(index);
      py[from] -=10;
      py[to]+=10;
    }
  }
}

void hanoi(int n, int from, int to, int temp ) {
  if (n==1) {
    // System.out.println("將盤子"+n+"從柱子"+from+"搬到 "+to+"") ;
    diskList.add(n);
    fromList.add(from);
    toList.add(to);
  } else {            // (B)大問題: 利用遞迴先解較小的問題
    hanoi(n-1, from, temp, to);   // 先暫時搬走上面的 n-1個盤子
    //將盤子n (=?)從柱子(from)搬到 (to) ;
    //  System.out.println("將盤子"+n+"從柱子"+from+"搬到 "+to+"") ;
    diskList.add(n);
    fromList.add(from);
    toList.add(to);

    hanoi( n-1, temp, to, from);   // 再搬回上面的 n-1個盤子
  }
}
}

void keyPressed(){
}
////////
void keyReleased(){
}
