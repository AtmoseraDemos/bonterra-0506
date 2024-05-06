"""
This module contains functions for combinatorial calculations. It includes the following functions:
- factorial(n): returns the factorial of n
- permutation(n, k): returns the number of permutations of n objects taken k at a time
- combination(n, k): returns the number of combinations of n objects taken k at a time
"""

class Combinatorics:
    factorial_memo = {}

    @staticmethod
    def factorial(n):
        """
        Calculate the factorial of a given number.

        Parameters:
        n (int): The number for which factorial needs to be calculated.

        Returns:
        int: The factorial of the given number.
        """
        if n in Combinatorics.factorial_memo:
            return Combinatorics.factorial_memo[n]
        if n == 0 or n == 1:
            result = 1
        else:
            result = n * Combinatorics.factorial(n-1)
        Combinatorics.factorial_memo[n] = result
        return result

    @staticmethod
    def permutation(n, k):
        """
        Calculate the number of permutations of n objects taken k at a time.

        Parameters:
        n (int): The total number of objects.
        k (int): The number of objects taken at a time.

        Returns:
        int: The number of permutations.
        """
        return Combinatorics.factorial(n) / Combinatorics.factorial(n-k)

    @staticmethod
    def combination(n, k):
        """
        Calculate the number of combinations of n objects taken k at a time.

        Parameters:
        n (int): The total number of objects.
        k (int): The number of objects taken at a time.

        Returns:
        int: The number of combinations.
        """
        return Combinatorics.permutation(n, k) / Combinatorics.factorial(k)

