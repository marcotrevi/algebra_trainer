class node {
  /*
  a node is a mathematical operator.
   operator types are:
   0) c : a constant
   1) + : multi-arity sum operator
   2) * : multi-arity product operator
   3) inv+ : unary inverse wrt sum
   4) inv* : unary inverse wrt product
   5) ...
   a tree is a set of nodes. 
   */
  ArrayList<node> children = new ArrayList<node>();

  node() {
  }

  void display() {
    // recursive display
    for (int i = 0; i < children.size(); i++) {
      node child = children.get(i);
      child.display();
    }
  }
}