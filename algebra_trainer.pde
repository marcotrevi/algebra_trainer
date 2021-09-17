/*
algebraic formula generator
 a formula is a tree of operator nodes.
 Leaves of the tree are constants.
 Each formula is tagged by complexity and used properties (commutativity, distributivity etc)
 Basic properties come from the definition of a ring (algebra)
 */

utility U = new utility();

node root;
node N1 = new node(0);
node N2 = new node(0);
node N3 = new node(0);
node N4 = new node(0);
node N5 = new node(0);

node[] nodes = new node[2];
int n_nodes = 0;

void setup() {
  N1.value = "a";
  N2.value = "b";
  N3.value = "c";
  N4.value = "d";
  N5.value = "e";
  /*
  ArrayList<node> nodesS1 = new ArrayList<node>();
   nodesS1.add(N1);
   nodesS1.add(N2);
   
   ArrayList<node> nodesS2 = new ArrayList<node>();
   nodesS2.add(N1);
   nodesS2.add(N4);
   
   ArrayList<node> nodesP = new ArrayList<node>();
   nodesP.add(U.nodeSum(nodesS1));
   nodesP.add(U.nodeSum(nodesS2));
   
   root = U.nodeProduct(nodesP); // *
   */

  // root = U.sum(N1, U.prod(U.sum(N2,N3), U.opp(U.prod(N4, U.opp(N5)))));
  root = U.binomialSquareExpanded(U.sum(U.opp(N1),N3), U.prod(N2,N2));
  //root.printNodeInfo(0);
  //println(); 
  //  root.printNode();
  //println(U.printFormula(root));
}

// module for polynomial decomposition

String composeItem() {
  // csv syntax: stem, answer, [choices]
  // choices are 4 or 6.
  String item = "";
  return item;
}
