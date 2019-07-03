import numpy as np
import scipy.signal as signal
from scipy.fftpack import fft
from scipy.stats import variation
import matplotlib.pyplot as plt
arr = [-5.1562500e-1,
-5.9375000e-1,
-5.9375000e-1,
-6.4062500e-1,
-6.3281250e-1,
-5.8593750e-1,
-5.8593750e-1,
-5.7031250e-1,
-4.8437500e-1,
-4.8437500e-1,
-4.1406250e-1,
-2.5781250e-1,
-2.5781250e-1,
-1.6406250e-1,
-7.0312500e-2,
-7.0312500e-2,
1.0937500e-1,
2.0312500e-1,
3.6718750e-1,
3.6718750e-1,
4.6875000e-1,
6.4062500e-1,
6.4062500e-1,
6.9531250e-1,
8.2812500e-1,
8.2812500e-1,
8.9843750e-1,
1.0468750e+0,
1.0468750e+0,
1.1406250e+0,
1.2656250e+0,
1.5468750e+0,
1.5468750e+0,
1.6953125e+0,
1.9609375e+0,
1.9609375e+0,
2.0703125e+0,
2.2968750e+0,
2.2968750e+0,
2.4296875e+0,
2.6718750e+0,
2.6718750e+0,
2.8046875e+0,
2.9140625e+0,
3.1640625e+0,
3.1640625e+0,
3.3046875e+0,
3.5859375e+0,
3.5859375e+0,
3.6953125e+0,
3.8515625e+0,
3.8515625e+0,
3.9062500e+0,
3.9765625e+0,
3.9765625e+0,
3.9921875e+0,
4.0000000e+0,
4.0000000e+0,
3.8750000e+0,
3.7343750e+0,
3.3671875e+0,
3.3671875e+0,
3.1171875e+0,
2.5781250e+0,
2.5781250e+0,
2.3203125e+0,
1.8125000e+0,
1.8125000e+0,
1.5703125e+0,
1.3359375e+0,
1.3359375e+0,
9.3750000e-1,
7.8906250e-1,
5.6250000e-1,
5.6250000e-1,
5.0000000e-1,
4.2187500e-1,
4.2187500e-1,
4.3750000e-1,
5.7031250e-1,
5.7031250e-1,
6.9531250e-1,
8.3593750e-1,
8.3593750e-1,
1.0937500e+0,
1.1796875e+0,
1.2968750e+0,
1.2968750e+0,
1.3125000e+0,
1.3671875e+0,
1.3671875e+0,
1.4218750e+0,
1.5234375e+0,
1.5234375e+0,
1.5625000e+0,
1.5625000e+0,
1.5625000e+0,
1.4843750e+0,
1.4062500e+0,
1.2109375e+0,
1.2109375e+0,
1.1093750e+0,
9.0625000e-1,
9.0625000e-1,
8.0468750e-1,
6.4062500e-1,
6.4062500e-1,
5.7031250e-1,
4.3750000e-1,
4.3750000e-1,
3.5156250e-1,
2.5781250e-1,
8.5937500e-2,
8.5937500e-2,
0.0000000e+0,
-1.7968750e-1,
-1.7968750e-1,
-2.7343750e-1,
-4.7656250e-1,
-4.7656250e-1,
-5.8593750e-1,
-8.2031250e-1,
-8.2031250e-1,
-9.3750000e-1,
-1.0546875e+0,
-1.2656250e+0,
-1.2656250e+0,
-1.3828125e+0,
-1.6250000e+0,
-1.6250000e+0,
-1.7421875e+0,
-1.8906250e+0,
-1.8906250e+0,
-1.9062500e+0,
-1.8750000e+0,
-1.8750000e+0,
-1.8515625e+0,
-1.7968750e+0,
-1.7968750e+0,
-1.6796875e+0,
-1.6406250e+0,
-1.5625000e+0,
-1.5625000e+0,
-1.5000000e+0,
-1.3437500e+0,
-1.3437500e+0,
-1.2812500e+0,
-1.1718750e+0,
-1.1718750e+0,
-1.1093750e+0,
-1.0703125e+0,
-1.0703125e+0,
-1.0312500e+0,
-1.0468750e+0,
-1.1093750e+0,
-1.1093750e+0,
-1.1562500e+0,
-1.2890625e+0,
-1.2890625e+0,
-1.3671875e+0,
-1.5000000e+0,
-1.5000000e+0,
-1.5312500e+0,
-1.5703125e+0,
-1.5703125e+0,
-1.6328125e+0,
-1.6328125e+0,
-1.6406250e+0,
-1.6406250e+0,
-1.6250000e+0,
-1.5625000e+0,
-1.5625000e+0,
-1.5000000e+0,
-1.3359375e+0,
-1.3359375e+0,
-1.2578125e+0,
-1.1796875e+0,
-1.1796875e+0,
-1.0156250e+0,
-9.2968750e-1,
-7.5000000e-1,
-7.5000000e-1,
-6.5625000e-1,
-4.4531250e-1,
-4.4531250e-1,
-3.3593750e-1,
-2.1093750e-1,
-2.1093750e-1,
-1.5625000e-1,
-1.0937500e-1,
-1.0937500e-1,
-1.0937500e-1,
-1.1718750e-1,
-2.1875000e-1,
-2.1875000e-1,
-2.8125000e-1,
-4.1406250e-1,
-4.1406250e-1,
-4.8437500e-1,
-6.7968750e-1,
-6.7968750e-1,
-8.0468750e-1,
-1.0625000e+0,
-1.0625000e+0,
-1.1718750e+0,
-1.2578125e+0,
-1.3437500e+0,
-1.3437500e+0,
-1.3437500e+0,
-1.2968750e+0,
-1.2968750e+0,
-1.2500000e+0,
-1.1640625e+0,
-1.1640625e+0,
-1.1171875e+0,
-1.0078125e+0,
-1.0078125e+0,
-9.4531250e-1,
-8.7500000e-1,
-8.7500000e-1,
-7.6562500e-1,
-7.2656250e-1,
-6.5625000e-1,
-6.5625000e-1,
-6.1718750e-1,
-5.7812500e-1,
-5.7812500e-1,
-5.8593750e-1,
-5.7812500e-1,
-5.7812500e-1,
-5.9375000e-1,
-6.0937500e-1,
-6.0937500e-1,
-6.0937500e-1,
-6.2500000e-1,
-7.0312500e-1,
-7.0312500e-1,
-7.4218750e-1,
-8.3593750e-1,
-8.3593750e-1,
-8.7500000e-1,
-9.2968750e-1,
-9.2968750e-1,
-9.4531250e-1,
-9.6875000e-1,
-9.6875000e-1,
-1.0000000e+0,
-1.0312500e+0,
-1.0703125e+0,
-1.0703125e+0,
-1.1015625e+0,
-1.2031250e+0,
-1.2031250e+0,
-1.2734375e+0,
-1.4453125e+0,
-1.4453125e+0,
-1.5156250e+0,
-1.6015625e+0,
-1.6015625e+0,
-1.6953125e+0,
-1.7265625e+0,
-1.7968750e+0,
-1.7968750e+0,
-1.8203125e+0,
-1.7968750e+0,
-1.7968750e+0,
-1.7734375e+0,
-1.6406250e+0,
-1.6406250e+0,
-1.5546875e+0,
-1.4375000e+0,
-1.4375000e+0,
-1.3671875e+0,
-1.3046875e+0,
-1.1953125e+0,
-1.1953125e+0,
-1.1406250e+0,
-1.0546875e+0,
-1.0546875e+0,
-1.0312500e+0,
-1.0078125e+0,
-1.0078125e+0,
-1.0078125e+0,
-9.6875000e-1,
-9.6875000e-1,
-9.4531250e-1,
-9.3750000e-1,
-8.8281250e-1,
-8.8281250e-1,
-8.6718750e-1,
-8.1250000e-1,
-8.1250000e-1,
-8.1250000e-1,
-8.1250000e-1,
-8.1250000e-1,
-8.1250000e-1,
-8.4375000e-1,
-8.4375000e-1,
-8.6718750e-1,
-8.8281250e-1,
-8.8281250e-1,
-9.2968750e-1,
-9.4531250e-1,
-9.6875000e-1,
-9.6875000e-1,
-9.6875000e-1,
-9.6093750e-1,
-9.6093750e-1,
-9.3750000e-1,
-8.3593750e-1,
-8.3593750e-1,
-7.7343750e-1,
-6.9531250e-1,
-6.9531250e-1,
-5.0000000e-1,
-3.9843750e-1,
-2.1875000e-1,
-2.1875000e-1,
-1.3281250e-1,
4.6875000e-2,
4.6875000e-2,
1.2500000e-1,
2.8906250e-1,
2.8906250e-1,
3.5937500e-1,
4.5312500e-1,
4.5312500e-1,
6.1718750e-1,
6.8750000e-1,
9.1406250e-1,
9.1406250e-1,
1.0546875e+0,
1.3281250e+0,
1.3281250e+0,
1.4765625e+0,
1.7578125e+0,
1.7578125e+0,
1.8828125e+0,
2.0234375e+0,
2.0234375e+0,
2.2812500e+0,
2.4062500e+0,
2.6250000e+0,
2.6250000e+0,
2.7265625e+0,
2.9218750e+0,
2.9218750e+0,
3.0156250e+0,
3.2109375e+0,
3.2109375e+0,
3.2968750e+0,
3.4687500e+0,
3.4687500e+0,
3.5312500e+0,
3.5781250e+0,
3.6093750e+0,
3.6093750e+0,
3.6171875e+0,
3.6562500e+0,
3.6562500e+0,
3.6718750e+0,
3.7031250e+0,
3.7031250e+0,
3.7421875e+0,
3.7656250e+0,
3.7656250e+0,
3.7812500e+0,
3.7890625e+0,
3.7500000e+0,
3.7500000e+0,
3.7031250e+0,
3.5703125e+0,
3.5703125e+0,
3.4921875e+0,
3.3671875e+0,
3.3671875e+0,
3.3359375e+0,
3.2656250e+0,
3.2656250e+0,
3.2500000e+0,
3.2578125e+0,
3.2578125e+0,
3.2578125e+0,
3.2578125e+0,
3.2812500e+0,
3.2812500e+0,
3.2890625e+0,
3.3046875e+0,
3.3046875e+0,
3.3046875e+0,
3.3359375e+0,
3.3359375e+0,
3.3593750e+0,
3.3906250e+0,
3.3906250e+0,
3.4531250e+0,
3.4687500e+0,
3.5000000e+0,
3.5000000e+0,
3.5312500e+0,
3.6328125e+0,
3.6328125e+0,
3.7109375e+0,
3.8828125e+0,
3.8828125e+0,
3.9609375e+0,
4.0234375e+0,
4.0234375e+0,
4.1484375e+0,
4.2343750e+0,
4.4218750e+0,
4.4218750e+0,
4.5234375e+0,
4.6875000e+0,
4.6875000e+0,
4.7656250e+0,
4.9609375e+0,
4.9609375e+0,
5.0546875e+0,
5.1562500e+0,
5.1562500e+0,
5.3437500e+0,
5.4453125e+0,
5.6875000e+0,
5.6875000e+0,
5.8125000e+0,
6.1250000e+0,
6.1250000e+0,
6.2421875e+0,
6.3593750e+0,
6.3593750e+0,
6.3828125e+0,
6.3281250e+0,
6.3281250e+0,
6.2578125e+0,
6.1718750e+0,
5.9218750e+0,
5.9218750e+0,
5.7968750e+0,
5.5468750e+0,
5.5468750e+0,
5.4140625e+0,
5.1562500e+0,
5.1562500e+0,
5.0000000e+0,
4.6640625e+0,
4.6640625e+0,
4.4921875e+0,
4.3203125e+0,
4.0234375e+0,
4.0234375e+0,
3.8828125e+0,
3.7031250e+0,
3.7031250e+0,
3.6171875e+0,
3.4609375e+0,
3.4609375e+0,
3.3828125e+0,
3.2812500e+0,
3.2812500e+0,
3.2500000e+0,
3.2187500e+0,
3.2187500e+0,
3.2031250e+0,
3.1796875e+0,
3.1640625e+0,
3.1640625e+0,
3.1718750e+0,
3.2343750e+0,
3.2343750e+0,
3.2968750e+0,
3.4296875e+0,
3.4296875e+0,
3.5078125e+0,
3.5781250e+0,
3.5781250e+0,
3.7031250e+0,
3.7343750e+0,
3.7812500e+0,
3.7812500e+0,
3.8046875e+0,
3.8828125e+0,
3.8828125e+0,
3.9140625e+0,
3.9531250e+0,
3.9531250e+0,
3.9531250e+0,
3.9453125e+0,
3.9453125e+0,
3.9296875e+0,
3.9218750e+0,
3.8593750e+0,
3.8593750e+0,
3.8203125e+0,
3.7421875e+0,
3.7421875e+0,
3.6875000e+0,
3.6406250e+0,
3.6406250e+0,
3.6406250e+0,
3.6406250e+0,
3.6406250e+0,
3.6875000e+0,
3.7265625e+0,
3.8203125e+0,
3.8203125e+0,
3.8593750e+0,
3.9453125e+0,
3.9453125e+0,
3.9921875e+0,
4.0859375e+0,
4.0859375e+0,
4.1328125e+0,
4.2578125e+0,
4.2578125e+0,
4.3359375e+0,
4.4140625e+0,
4.6171875e+0,
4.6171875e+0,
4.7421875e+0,
4.9843750e+0,
4.9843750e+0,
5.0859375e+0,
5.2187500e+0,
5.2187500e+0,
5.2734375e+0,
5.4375000e+0,
5.4375000e+0,
5.5312500e+0,
5.6171875e+0,
5.7187500e+0,
5.7187500e+0,
5.7343750e+0,
5.6953125e+0,
5.6953125e+0,
5.6718750e+0,
5.6015625e+0,
5.6015625e+0,
5.5625000e+0,
5.4296875e+0,
5.4296875e+0,
5.3437500e+0,
5.2500000e+0,
5.2500000e+0,
5.0156250e+0,
4.8828125e+0,
4.6562500e+0,
4.6562500e+0,
4.5625000e+0,
4.4843750e+0,
4.4843750e+0,
4.4687500e+0,
4.5234375e+0,
4.5234375e+0,
4.5937500e+0,
4.6796875e+0,
4.6796875e+0,
4.8203125e+0,
4.8828125e+0,
4.9375000e+0,
4.9375000e+0,
4.9453125e+0,
4.9140625e+0,
4.9140625e+0,
4.8906250e+0,
4.8359375e+0,
4.8359375e+0,
4.8125000e+0,
4.7968750e+0,
4.7968750e+0,
4.7578125e+0,
4.7500000e+0,
4.6718750e+0,
4.6718750e+0,
4.6406250e+0,
4.5781250e+0,
4.5781250e+0,
4.5468750e+0,
4.4531250e+0,
4.4531250e+0,
4.3750000e+0,
4.2968750e+0,
4.2968750e+0,
4.1640625e+0,
4.0937500e+0,
4.0000000e+0,
4.0000000e+0,
3.9687500e+0,
3.8984375e+0,
3.8984375e+0,
3.8671875e+0,
3.8125000e+0,
3.8125000e+0,
3.7812500e+0,
3.7265625e+0,
3.7265625e+0,
3.7187500e+0,
3.7265625e+0,
3.7421875e+0,
3.7421875e+0,
3.7500000e+0,
3.7812500e+0,
3.7812500e+0,
3.7968750e+0,
3.8515625e+0,
3.8515625e+0,
3.8750000e+0,
3.9453125e+0,
3.9453125e+0,
3.9687500e+0,
4.0078125e+0,
4.0234375e+0,
4.0234375e+0,
3.9843750e+0,
3.8750000e+0,
3.8750000e+0,
3.8203125e+0,
3.6718750e+0,
3.6718750e+0,
3.5937500e+0,
3.4687500e+0,
3.4687500e+0,
3.4062500e+0,
3.3281250e+0,
3.3281250e+0,
3.1718750e+0,
3.0859375e+0,
2.8984375e+0,
2.8984375e+0,
2.8046875e+0,
2.6093750e+0,
2.6093750e+0,
2.5390625e+0,
2.4140625e+0,
2.4140625e+0,
2.3671875e+0,
2.3046875e+0,
2.3046875e+0,
2.2031250e+0,
2.1484375e+0,
2.0546875e+0,
2.0546875e+0,
2.0000000e+0,
1.9140625e+0,
1.9140625e+0,
1.8750000e+0,
1.8046875e+0,
1.8046875e+0,
1.7500000e+0,
1.7187500e+0,
1.7187500e+0,
1.6328125e+0,
1.6015625e+0,
1.5625000e+0,
1.5625000e+0,
1.5468750e+0,
1.4765625e+0,
1.4765625e+0,
1.4296875e+0,
1.3593750e+0,
1.3593750e+0,
1.2968750e+0,
1.2343750e+0,
1.2343750e+0,
1.0937500e+0,
1.0312500e+0,
8.8281250e-1,
8.8281250e-1,
8.2812500e-1,
7.1875000e-1,
7.1875000e-1,
6.7187500e-1,
6.0156250e-1,
6.0156250e-1,
5.8593750e-1,
5.7031250e-1,
5.7031250e-1,
5.7031250e-1,
5.7812500e-1,
6.0156250e-1,
6.0156250e-1,
6.2500000e-1,
6.6406250e-1,
6.6406250e-1,
7.1093750e-1,
8.1250000e-1,
8.1250000e-1,
8.9062500e-1,
1.1250000e+0,
1.1250000e+0,
1.2578125e+0,
1.3984375e+0,
1.7343750e+0,
1.7343750e+0,
1.9062500e+0,
2.2500000e+0,
2.2500000e+0,
2.4062500e+0,
2.7031250e+0,
2.7031250e+0,
2.8359375e+0,
3.0781250e+0,
3.0781250e+0,
3.1718750e+0,
3.2656250e+0,
3.2656250e+0,
3.4453125e+0,
3.5468750e+0,
3.7265625e+0,
3.7265625e+0,
3.8203125e+0,
4.0000000e+0,
4.0000000e+0,
4.0859375e+0,
4.2265625e+0,
4.2265625e+0,
4.2890625e+0,
4.3359375e+0,
4.3359375e+0,
4.4375000e+0,
4.4843750e+0,
4.5703125e+0,
4.5703125e+0,
4.6328125e+0,
4.7734375e+0,
4.7734375e+0,
4.8281250e+0,
4.8437500e+0,
4.8437500e+0,
4.8125000e+0,
4.7500000e+0,
4.7500000e+0,
4.5625000e+0,
4.4687500e+0,
4.2968750e+0,
4.2968750e+0,
4.2421875e+0,
4.1328125e+0,
4.1328125e+0,
4.0703125e+0,
3.9609375e+0,
3.9609375e+0,
3.9140625e+0,
3.8671875e+0,
3.8671875e+0,
3.7500000e+0,
3.6718750e+0,
3.5781250e+0,
3.5781250e+0,
3.5390625e+0,
3.4453125e+0,
3.4453125e+0,
3.3828125e+0,
3.2421875e+0,
3.2421875e+0,
3.1796875e+0,
3.1093750e+0,
3.1093750e+0,
3.0781250e+0,
3.0468750e+0,
2.9921875e+0,
2.9921875e+0,
2.9531250e+0,
2.8828125e+0,
2.8828125e+0,
2.8359375e+0,
2.7500000e+0,
2.7500000e+0,
2.6953125e+0,
2.5468750e+0,
2.5468750e+0,
2.4765625e+0,
2.3750000e+0,
2.1406250e+0,
2.1406250e+0,
1.9921875e+0,
1.6875000e+0,
1.6875000e+0,
1.5468750e+0,
1.3437500e+0,
1.3437500e+0,
1.2890625e+0,
1.2187500e+0,
1.2187500e+0,
1.1875000e+0,
1.1718750e+0,
1.1718750e+0,
1.1718750e+0,
1.1718750e+0,
1.1796875e+0,
1.1796875e+0,
1.1875000e+0,
1.1484375e+0,
1.1484375e+0,
1.1093750e+0,
1.0703125e+0,
1.0703125e+0,
1.0468750e+0,
1.0546875e+0,
1.0546875e+0,
1.0234375e+0,
9.8437500e-1,
8.9843750e-1,
8.9843750e-1,
8.5156250e-1,
7.2656250e-1,
7.2656250e-1,
6.4843750e-1,
4.6875000e-1,
4.6875000e-1,
3.5156250e-1,
2.2656250e-1,
2.2656250e-1,
-9.3750000e-2,
-2.5000000e-1,
-5.3125000e-1,
-5.3125000e-1,
-6.5625000e-1,
-8.0468750e-1,
-8.0468750e-1,
-8.2031250e-1,
-8.0468750e-1,
-8.0468750e-1,
-7.7343750e-1,
-7.1875000e-1,
-7.1875000e-1,
-6.0156250e-1,
-5.7031250e-1,
-5.9375000e-1,
-5.9375000e-1,
-6.4843750e-1,
-7.6562500e-1,
-7.6562500e-1,
-8.2031250e-1,
-9.2968750e-1,
-9.2968750e-1,
-9.8437500e-1,
-1.0937500e+0,
-1.0937500e+0,
-1.1562500e+0,
-1.2187500e+0,
-1.3046875e+0,
-1.3046875e+0,
-1.3437500e+0,
-1.3437500e+0,
-1.3437500e+0,
-1.3281250e+0,
-1.2578125e+0,
-1.2578125e+0,
-1.2265625e+0,
-1.0859375e+0,
-1.0859375e+0,
-9.9218750e-1,
-8.8281250e-1,
-6.0156250e-1,
-6.0156250e-1,
-4.0625000e-1,
-1.5625000e-2,
-1.5625000e-2,
1.6406250e-1,
4.7656250e-1,
4.7656250e-1,
6.0156250e-1,
7.7343750e-1,
7.7343750e-1,
8.4375000e-1,
8.8281250e-1,
8.8281250e-1,
9.2187500e-1,
9.2968750e-1,
9.5312500e-1,
9.5312500e-1,
9.9218750e-1,
1.1328125e+0,
1.1328125e+0,
1.2031250e+0,
1.2656250e+0,
1.2656250e+0,
1.2500000e+0,
1.2265625e+0,
1.2265625e+0,
1.1562500e+0,
1.1328125e+0,
1.0937500e+0,
1.0937500e+0,
1.0781250e+0,
1.0781250e+0,
1.0781250e+0,
1.1015625e+0,
1.2031250e+0,
1.2031250e+0,
1.2656250e+0,
1.3359375e+0,
1.3359375e+0,
1.3984375e+0,
1.4375000e+0,
1.5234375e+0,
1.5234375e+0,
1.5625000e+0,
1.6171875e+0,
1.6171875e+0,
1.6328125e+0,
1.7031250e+0,
1.7031250e+0,
1.7265625e+0,
1.7343750e+0,
1.7343750e+0,
1.7343750e+0,
1.7656250e+0,
1.8281250e+0,
1.8281250e+0,
1.7968750e+0,
1.6328125e+0,
1.6328125e+0,
1.5234375e+0,
1.2578125e+0,
1.2578125e+0,
1.0859375e+0,
6.6406250e-1,
6.6406250e-1,
4.3750000e-1,
2.1875000e-1,
-1.7187500e-1,
-1.7187500e-1,
-3.2812500e-1,
-7.2656250e-1,
-7.2656250e-1,
-9.4531250e-1,
-1.3828125e+0,
-1.3828125e+0,
-1.5937500e+0,
-2.0937500e+0,
-2.0937500e+0,
-2.3828125e+0,
-2.7343750e+0,
-3.5468750e+0,
-3.5468750e+0,
-3.9140625e+0,
-4.5000000e+0,
-4.5000000e+0,
-4.7109375e+0,
-5.0468750e+0,
-5.0468750e+0,
-5.1796875e+0,
-5.3203125e+0,
-5.3203125e+0,
-5.3281250e+0,
-5.2968750e+0,
-5.2968750e+0,
-5.2343750e+0,
-5.2187500e+0,
-5.1640625e+0,
-5.1640625e+0,
-5.1093750e+0,
-4.9765625e+0,
-4.9765625e+0,
-4.9296875e+0,
-4.9140625e+0,
-4.9140625e+0,
-4.9218750e+0,
-4.9140625e+0,
-4.9140625e+0,
-4.8671875e+0,
-4.8593750e+0,
-4.8984375e+0,
-4.8984375e+0,
-4.9375000e+0,
-4.9765625e+0,
-4.9765625e+0,
-5.0078125e+0,
-5.0625000e+0,
-5.0625000e+0,
-5.0781250e+0,
-5.1093750e+0,
-5.1093750e+0,
-5.1093750e+0,
-5.0859375e+0,
-4.9765625e+0,
-4.9765625e+0,
-4.8984375e+0,
-4.7578125e+0,
-4.7578125e+0,
-4.6796875e+0,
-4.5312500e+0,
-4.5312500e+0,
-4.5000000e+0,
-4.4843750e+0,
-4.4843750e+0,
-4.5234375e+0,
-4.5703125e+0,
-4.7109375e+0,
-4.7109375e+0,
-4.8203125e+0,
-5.0390625e+0,
-5.0390625e+0,
-5.1562500e+0,
-5.3203125e+0,
-5.3203125e+0,
-5.3750000e+0,
-5.4296875e+0,
-5.4296875e+0,
-5.4218750e+0,
-5.3906250e+0,
-5.2812500e+0,
-5.2812500e+0,
-5.2031250e+0,
-5.0468750e+0,
-5.0468750e+0,
-4.9609375e+0,
-4.7578125e+0,
-4.7578125e+0,
-4.6406250e+0,
-4.4218750e+0,
-4.4218750e+0,
-4.3203125e+0,
-4.2343750e+0,
-4.1328125e+0,
-4.1328125e+0,
-4.1015625e+0,
-4.0859375e+0,
-4.0859375e+0,
-4.1015625e+0,
-4.1250000e+0,
-4.1250000e+0,
-4.1640625e+0,
-4.2656250e+0,
-4.2656250e+0,
-4.3203125e+0,
-4.3671875e+0,
-4.3671875e+0,
-4.4453125e+0,
-4.4765625e+0,
-4.5468750e+0,
-4.5468750e+0,
-4.6015625e+0,
-4.7031250e+0,
-4.7031250e+0,
-4.7421875e+0,
-4.7812500e+0,
-4.7812500e+0,
-4.7968750e+0,
-4.8046875e+0,
-4.8046875e+0,
-4.7890625e+0,
-4.7812500e+0,
-4.7187500e+0,
-4.7187500e+0,
-4.6953125e+0,
-4.6328125e+0,
-4.6328125e+0,
-4.5937500e+0,
-4.5625000e+0,
-4.5625000e+0,
-4.5546875e+0,
-4.5468750e+0,
-4.5468750e+0,
-4.5078125e+0,
-4.4687500e+0,
-4.3984375e+0,
-4.3984375e+0,
-4.3671875e+0,
-4.2890625e+0,
-4.2890625e+0,
-4.2578125e+0,
-4.1640625e+0,
-4.1640625e+0,
-4.1250000e+0,
-4.0781250e+0,
-4.0781250e+0,
-3.9531250e+0,
-3.8671875e+0,
-3.6875000e+0,
-3.6875000e+0,
-3.6250000e+0,
-3.4843750e+0,
-3.4843750e+0,
-3.4062500e+0,
-3.2343750e+0,
-3.2343750e+0,
-3.1640625e+0,
-3.0937500e+0,
-3.0937500e+0,
-3.0937500e+0,
-3.1171875e+0,
-3.2343750e+0,
-3.2343750e+0,
-3.2968750e+0,
-3.4687500e+0,
-3.4687500e+0,
-3.5703125e+0,
-3.7109375e+0,
-3.7109375e+0,
-3.7812500e+0,
-3.8984375e+0,
-3.8984375e+0,
-3.9375000e+0,
-3.9687500e+0,
-4.0156250e+0,
-4.0156250e+0,
-4.0156250e+0,
-4.0546875e+0,
-4.0546875e+0,
-4.0781250e+0,
-4.1406250e+0,
-4.1406250e+0,
-4.1875000e+0,
-4.3046875e+0,
-4.3046875e+0,
-4.3671875e+0,
-4.4218750e+0,
-4.4218750e+0,
-4.4921875e+0,
-4.5312500e+0,
-4.6015625e+0,
-4.6015625e+0,
-4.6171875e+0,
-4.5468750e+0,
-4.5468750e+0,
-4.4765625e+0,
-4.3046875e+0,
-4.3046875e+0,
-4.2187500e+0,
-4.1562500e+0,
-4.1562500e+0,
-4.0312500e+0,
-3.9609375e+0,
-3.8593750e+0,
-3.8593750e+0,
-3.8125000e+0,
-3.7578125e+0,
-3.7578125e+0,
-3.7421875e+0,
-3.7500000e+0,
-3.7500000e+0,
-3.7812500e+0,
-3.8046875e+0,
-3.8046875e+0,
-3.8750000e+0,
-3.9296875e+0,
-4.0937500e+0,
-4.0937500e+0,
-4.1953125e+0,
-4.4062500e+0,
-4.4062500e+0,
-4.5000000e+0,
-4.7187500e+0,
-4.7187500e+0,
-4.8437500e+0,
-4.9609375e+0,
-4.9609375e+0,
-5.1484375e+0,
-5.2109375e+0,
-5.2656250e+0,
-5.2656250e+0,
-5.2890625e+0,
-5.3359375e+0,
-5.3359375e+0,
-5.3515625e+0,
-5.4062500e+0,
-5.4062500e+0,
-5.4453125e+0,
-5.5312500e+0,
-5.5312500e+0,
-5.5859375e+0,
-5.6406250e+0,
-5.7656250e+0,
-5.7656250e+0,
-5.8203125e+0,
-5.8750000e+0,
-5.8750000e+0,
-5.8828125e+0,
-5.8203125e+0,
-5.8203125e+0,
-5.7734375e+0,
-5.7343750e+0,
-5.7343750e+0,
-5.7187500e+0,
-5.6875000e+0,
-5.5625000e+0,
-5.5625000e+0,
-5.4843750e+0,
-5.3125000e+0,
-5.3125000e+0,
-5.2187500e+0,
-4.9609375e+0,
-4.9609375e+0,
-4.8203125e+0,
-4.5078125e+0,
-4.5078125e+0,
-4.3593750e+0,
-4.1562500e+0,
-4.1562500e+0,
-3.8593750e+0,
-3.8359375e+0,
-3.9218750e+0,
-3.9218750e+0,
-3.9609375e+0,
-4.0468750e+0,
-4.0468750e+0,
-4.1328125e+0,
-4.3437500e+0,
-4.3437500e+0,
-4.4531250e+0,
-4.5625000e+0,
-4.5625000e+0,
-4.7500000e+0,
-4.8203125e+0,
-4.9062500e+0,
-4.9062500e+0,
-4.9375000e+0,
-5.0390625e+0,
-5.0390625e+0,
-5.0703125e+0,
-5.1328125e+0,
-5.1328125e+0,
-5.1875000e+0,
-5.2500000e+0,
-5.2500000e+0,
-5.3984375e+0,
-5.4921875e+0,
-5.6640625e+0,
-5.6640625e+0,
-5.7656250e+0,
-6.0000000e+0,
-6.0000000e+0,
-6.1171875e+0,
-6.2734375e+0,
-6.2734375e+0,
-6.3203125e+0,
-6.3515625e+0,
-6.3515625e+0,
-6.3515625e+0,
-6.3437500e+0,
-6.3359375e+0,
-6.3359375e+0,
-6.3593750e+0,
-6.3984375e+0,
-6.3984375e+0,
-6.4218750e+0,
-6.5078125e+0,
-6.5078125e+0,
-6.5781250e+0,
-6.7812500e+0,
-6.7812500e+0,
-6.8984375e+0,
-7.0156250e+0,
-7.2031250e+0,
-7.2031250e+0,
-7.2968750e+0,
-7.5625000e+0,
-7.5625000e+0,
-7.7656250e+0,
-8.1250000e+0,
-8.1250000e+0,
-8.2734375e+0,
-8.4921875e+0,
-8.4921875e+0,
-8.5546875e+0,
-8.6093750e+0,
-8.6484375e+0,
-8.6484375e+0,
-8.6328125e+0,
-8.5156250e+0,
-8.5156250e+0,
-8.4218750e+0,
-8.1875000e+0,
-8.1875000e+0,
-8.0468750e+0,
-7.8046875e+0,
-7.8046875e+0,
-7.7109375e+0,
-7.5859375e+0,
-7.5859375e+0,
-7.3125000e+0,
-7.1640625e+0,
-6.8203125e+0,
-6.8203125e+0,
-6.6406250e+0,
-6.3515625e+0,
-6.3515625e+0,
-6.2031250e+0,
-5.8359375e+0,
-5.8359375e+0,
-5.6406250e+0,
-5.4218750e+0,
-5.4218750e+0,
-5.0312500e+0,
-4.8281250e+0,
-4.3750000e+0,
-4.3750000e+0,
-4.1484375e+0,
-3.8046875e+0,
-3.8046875e+0,
-3.6875000e+0,
-3.4687500e+0,
-3.4687500e+0,
-3.3671875e+0,
-3.2578125e+0,
-3.2578125e+0,
-3.0312500e+0,
-2.9140625e+0,
-2.6328125e+0,
-2.6328125e+0,
-2.4843750e+0,
-2.2109375e+0,
-2.2109375e+0,
-2.0546875e+0,
-1.7343750e+0,
-1.7343750e+0,
-1.5625000e+0,
-1.4062500e+0,
-1.4062500e+0,
-1.1718750e+0,
-1.0625000e+0,
-8.2031250e-1,
-8.2031250e-1,
-7.2656250e-1,
-3.9062500e-1,
-3.9062500e-1,
-2.4218750e-1,
-1.5625000e-2,
-1.5625000e-2,
8.5937500e-2,
2.5781250e-1,
2.5781250e-1,
3.0468750e-1,
3.2812500e-1,
3.2812500e-1,
3.2812500e-1,
2.9687500e-1,
2.8906250e-1,
2.8906250e-1,
3.3593750e-1,
5.3125000e-1,
5.3125000e-1,
6.4843750e-1,
9.6875000e-1,
9.6875000e-1,
1.1484375e+0,
1.3593750e+0,
1.7343750e+0,
1.7343750e+0,
1.8984375e+0,
2.2031250e+0,
2.2031250e+0,
2.3437500e+0,
2.4765625e+0,
2.4765625e+0,
2.4921875e+0,
2.5078125e+0,
2.5078125e+0,
2.5000000e+0,
2.5000000e+0,
2.5000000e+0,
2.4609375e+0,
2.4296875e+0,
2.3906250e+0,
2.3906250e+0,
2.3828125e+0,
2.3750000e+0,
2.3750000e+0,
2.3750000e+0,
2.4062500e+0,
2.4062500e+0,
2.3828125e+0,
2.3515625e+0,
2.3515625e+0,
2.2578125e+0,
2.2187500e+0,
2.1328125e+0,
2.1328125e+0,
2.0625000e+0,
1.9296875e+0,
1.9296875e+0,
1.8828125e+0,
1.8046875e+0,
1.8046875e+0,
1.7656250e+0,
1.7343750e+0,
1.7343750e+0,
1.7109375e+0,
1.7031250e+0,
1.7187500e+0,
1.7187500e+0,
1.7265625e+0,
1.7421875e+0,
1.7421875e+0,
1.7578125e+0,
1.7734375e+0,
1.7734375e+0,
1.7812500e+0,
1.7890625e+0,
1.7890625e+0,
1.7578125e+0,
1.7031250e+0,
1.5546875e+0,
1.5546875e+0,
1.4843750e+0,
1.3359375e+0,
1.3359375e+0,
1.2656250e+0,
1.1171875e+0,
1.1171875e+0,
1.0312500e+0,
8.6718750e-1,
8.6718750e-1,
7.6562500e-1,
6.4062500e-1,
3.8281250e-1,
3.8281250e-1,
2.6562500e-1,
2.3437500e-2,
2.3437500e-2,
-1.0937500e-1,
-3.5937500e-1,
-3.5937500e-1,
-4.7656250e-1,
-6.9531250e-1,
-6.9531250e-1,
-8.0468750e-1,
-9.1406250e-1,
-1.0703125e+0,
-1.0703125e+0,
-1.1406250e+0,
-1.2656250e+0,
-1.2656250e+0,
-1.3203125e+0,
-1.3984375e+0,
-1.3984375e+0,
-1.4062500e+0,
-1.3593750e+0,
-1.3593750e+0,
-1.3203125e+0,
-1.2500000e+0,
-1.2500000e+0,
-1.0781250e+0,
-9.7656250e-1,
-7.3437500e-1,
-7.3437500e-1,
-5.8593750e-1,
-3.2812500e-1,
-3.2812500e-1,
-2.1875000e-1,
-8.5937500e-2,
-8.5937500e-2,
-7.0312500e-2,
-7.0312500e-2,
-7.0312500e-2,
-8.5937500e-2,
-1.0156250e-1,
-1.7187500e-1,
-1.7187500e-1,
-2.5000000e-1,
-3.9843750e-1,
-3.9843750e-1,
-4.7656250e-1,
-6.5625000e-1,
-6.5625000e-1,
-7.2656250e-1,
-8.2031250e-1,
-8.2031250e-1,
-9.9218750e-1,
-1.0468750e+0,
-1.0937500e+0,
-1.0937500e+0,
-1.0781250e+0,
-1.0234375e+0,
-1.0234375e+0,
-1.0000000e+0,
-9.1406250e-1,
-9.1406250e-1,
-8.6718750e-1,
-8.0468750e-1,
-8.0468750e-1,
-6.8750000e-1,
-6.2500000e-1,
-4.9218750e-1,
-4.9218750e-1,
-4.2968750e-1,
-3.3593750e-1,
-3.3593750e-1,
-3.1250000e-1,
-3.0468750e-1,
-3.0468750e-1,
-3.1250000e-1,
-3.0468750e-1,
-3.0468750e-1,
-2.8125000e-1,
-2.6562500e-1,
-3.0468750e-1,
-3.0468750e-1,
-3.3593750e-1,
-3.8281250e-1,
-3.8281250e-1,
-4.0625000e-1,
-4.3750000e-1,
-4.3750000e-1,
-4.6875000e-1,
-5.7031250e-1,
-5.7031250e-1,
-5.7812500e-1,
-5.5468750e-1,
-5.0000000e-1,
-5.0000000e-1,
-4.8437500e-1,
-4.4531250e-1,
-4.4531250e-1,
-4.1406250e-1,
-3.5156250e-1,
-3.5156250e-1,
-3.4375000e-1,
-3.2031250e-1,
-3.2031250e-1,
-3.0468750e-1,
-2.8906250e-1,
-2.8906250e-1,
-2.8125000e-1,
-3.0468750e-1,
-3.4375000e-1
]
arr_new = [i*(-1) for i in arr]
N = len(arr)
T = 1.0 / 5.0
print(len(arr))
yf = fft(arr)
xf = np.linspace(0.0, 1.0 / (2.0 * T), N // 2)
plt.plot(xf, 2.0 / N * np.abs(yf[0: N // 2]))
plt.xlabel('fr, Гц')
plt.ylabel('А, мм')
plt.title('Фронталь' + ' (дисперсия = ' + str(np.var(arr)) + ')')
plt.grid()
plt.show()
# f, Pper_spec = signal.welch(arr, 10, 'flattop', scaling='spectrum')
# plt.semilogy(f, Pper_spec)
# plt.xlabel('frequency [Hz]')
# plt.ylabel('PSD')
# plt.grid()
# plt.show()