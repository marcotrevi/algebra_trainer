class node {
  /*
  a node is a mathematical operator.
   operator types are:
   0) c : a constant
   1) + : multi-arity sum operator (at least binary)
   2) * : multi-arity product operator (at least binary)
   3) inv+ : unary inverse wrt sum
   4) inv* : unary inverse wrt product
   5) ...
   a tree is a set of nodes. 
   */
  int type = -1;
  int ID;
  String value = ""; // formula up to this node

  ArrayList<node> children = new ArrayList<node>();

  node(int type) {
    this.type = type;
  }

  String set_value() {
    String v = "";
    switch(type) {
    case 0:
      v = value;
      break;
    case 1:
      v = "+";
      break;
    case 2:
      v = "*";
      break;
    }    
    for (int i = 0; i < children.size(); i++ ) {
      node child = children.get(i);
      v = v + child.set_value();
    }
    return v;
  }

  void display() {
    // recursive display
    /*
    ...do something here...
     */
    for (int i = 0; i < children.size(); i++) {
      node child = children.get(i);
      child.display();
    }
  }

  void printme(int depth) {
    // recursive display
    for (int i=0; i<depth; i++) {
      print("-");
    }
    println("node "+ID+" type: "+type+" value: "+value);
    for (int i = 0; i < children.size(); i++) {
      node child = children.get(i);
      child.printme(depth+1);
    }
  }
}