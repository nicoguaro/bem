# -*- coding: utf-8 -*-
"""
Test cases for functions on bem.py
"""
import numpy as np
from bem import assem


# def test_assem():
# Square with side 2
coords = np.array([
    [-1, -1],
    [1, -1],
    [1, 1],
    [-1, 1]])
elems = np.array([
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 0]])
Gmat, Fmat = assem(coords, elems)

G00 = 1/np.pi
G01 = 1/np.pi - (np.log(5) + np.arctan(2))/(2*np.pi)
G02 = 1/np.pi - (0.5*np.log(5) + 2*np.arctan(1/2))/np.pi
G_exact = np.array([
    [G00, G01, G02, G01],
    [G01, G00, G01, G02],
    [G02, G01, G00, G01],
    [G01, G02, G01, G00]])
assert np.allclose(Gmat, G_exact)

F00 = -0.5
F01 = np.arctan(2)/(2*np.pi)
F02 = np.arctan(1/2)/np.pi
F_exact = np.array([
    [F00, F01, F02, F01],
    [F01, F00, F01, F02],
    [F02, F01, F00, F01],
    [F01, F02, F01, F00]])
assert np.allclose(Fmat, F_exact)
