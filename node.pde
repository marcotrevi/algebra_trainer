class node {
  /*
  a node is a mathematical formula.
   operator types are:
   0) c : a constant
   1) + : multi-arity sum operator (at least binary)
   2) * : multi-arity product operator (at least binary)
   3) inv+ : unary inverse wrt sum (has only 1 child)
   4) inv* : unary inverse wrt product (has only 1 child)
   5) pow: power
   6) ...
   a tree is a set of nodes. 
   */
  int type = -1;
  int parentType = -1;
  int ID = -1;
  String value = ""; // formula up to this node
  int power = 1; // power exponent if type = 5
  int formulaDepth = 0;
  int formulaLength = 0;
  ArrayList<node> children = new ArrayList<node>();

  node(int type) {
    this.type = type;
    switch(type) {
    case 0:
      value = "";
      break;
    case 1:
      value = "+";
      break;
    case 2:
      value = "*";
      break;
    case 3:
      value = "-";
      break;
    case 4:
      value = "/";
      break;
    case 5:
      value = "^";
      break;
    }
  }

  void printNodeInfo(int depth) {
    // recursive display
    for (int i=0; i<depth; i++) {
      print("-");
    }
    println("node "+ID+" type: "+type+" parent type: "+parentType+" value: "+value);
    for (int i = 0; i < children.size(); i++) {
      node child = children.get(i);
      child.printNodeInfo(depth+1);
    }
  }
}
