# Stepped-Impedance-Low-Pass-Microstrip-Filter
This is a design procedure of Stepped-Impedance Low-Pass Microstrip filter design.
Microstrip filters are cheap, easy to build and also small. Therefore microstrips are widely used in real world applications (antennas, radio filters, ...).
I have designed the filter for some given specifications.

    Maximally flat response
    Pass-band gain between 0 to -2dB for frequency(f) < fp = 1 GHz
    Minimum stop-band attenuation for frequency(f) > fs = 1.8 GHz
    FR4 substrate with thickness of 1.58 mm
    Copper conductors with thickness of 35 um
    Filter impedance of 50 ohm
    Minimum width of microstrip line = 0.203 mm

I have provided the design procedure of the filter in Microstrip Low-Pass Filter Design.pdf.
I must mention that I have used a butterworth shunt-first filter in order to satisfy the given specifications. 
I have done the design followed by the steps given below. It may help to build a filter deisgn on your own.
    
    1. Select the filter type according to given specifications
    2. Decide the order of the filter and cut-off frequency (if not given)
    3. Find element values of each component
    4. Calculate component values (inductance and capacitance)
    5. Calculate electrical lengths
    6. Calculate widths and lengths of microstrip lines for each impedance
    7. Design the filter with the widths and lengths calculated
