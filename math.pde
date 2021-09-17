class math {
  // all math utilities
  int[] primes =  {2, 3, 5, 7, 11, 13, 17, 19, 23, 
    29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 
    71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 
    113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 
    173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 
    229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 
    281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 
    349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 
    409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 
    463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 
    541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 
    601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 
    659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 
    733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 
    809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 
    863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 
    941, 947, 953, 967, 971, 977, 983, 991, 997};

  math() {
    /* fraction test
    int a = 6 ;
    int b = 20;
    int c = 4;
    int d = 10;
    int[] sum = fractionSum(a, b, c, d);
    println(a+"/"+b+" + "+c+"/"+d+" = " + sum[0] + "/" + sum[1]);
    int[] simplified = fractionSimplify(sum[0], sum[1]);
    println("simplified: "+simplified[0]+"/"+simplified[1]);
    */
  }

  IntList primeDecomposition(int n) {
    // returns an IntList of exponents
    // decomposition[i] is the exponent of the i-th prime number in the factorization of n
    IntList decomposition = new IntList();
    for (int i=0; i<primes.length; i++ ) {
      decomposition.append(0);
      int s = 0;
      while (n % primes[i] == 0) {
        s++;
        decomposition.set(i, s);
        n = n/primes[i];
      }
      if (n == 1) {
        i = primes.length;
      }
    }
    return decomposition;
  }

  int lcm(int a, int b) {
    int lcm = 1;
    IntList dec_a = primeDecomposition(a);
    IntList dec_b = primeDecomposition(b);
    int la = dec_a.size();
    int lb = dec_b.size();
    if (la < lb) {
      // a has fewer factors than b
      for (int i=0; i<lb-la; i++) {
        dec_a.append(0);
      }
    } 
    if (la > lb) {
      // b has fewer factors than a
      for (int i=0; i<la-lb; i++) {
        dec_b.append(0);
      }
    }
    for (int k=0; k<dec_a.size(); k++) {
      lcm = lcm*int(pow(primes[k], max(dec_a.get(k), dec_b.get(k))));
    }
    return lcm;
  }

  int gcd(int a, int b) {
    int gcd = 1;
    IntList dec_a = primeDecomposition(a);
    IntList dec_b = primeDecomposition(b);
    int l = min(dec_a.size(), dec_b.size());
    for (int i=0; i<l; i++) {
      if (dec_a.get(i)*dec_b.get(i) != 0) {
        // found a common divisor
        gcd = gcd*int(pow(primes[i], min(dec_a.get(i), dec_b.get(i))));
      }
    }
    return gcd;
  }

  int[] fractionSum(int a, int b, int c, int d) {
    // returns the fraction a/b + c/d
    int[] sumFraction = new int[2]; // numerator and denominator
    int lcm = lcm(b, d);
    sumFraction[0] = lcm/b*a + lcm/d*c;
    sumFraction[1] = lcm;
    return sumFraction;
  }

  int[] fractionSimplify(int a, int b) {
    int[] simplifiedFraction = new int[2];
    int gcd = gcd(a, b);
    simplifiedFraction[0] = a/gcd;
    simplifiedFraction[1] = b/gcd;
    return simplifiedFraction;
  }
}
