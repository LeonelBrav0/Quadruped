#include <iostream>
#include <vector>
#include <cmath>
#include <map>
#include <fstream>
#include <string>
#include "project_properties.h"
#include "fir_filter.h"
#include <map>
#include <unistd.h>
#include <cstdint>
#include <fcntl.h>
#include <sys/mman.h>

constexpr double PI = 3.14159265358979323846;

void gen_cos(std::vector<double>& f, double A, double w, double phi, std::vector<double>& t)
{
    for (int i = 0; i < t.size(); ++i)
    {
        f.push_back(A*std::cos(w*t[i] - phi));
    }
    return;
}

void gen_step(std::vector<double>& f, double t0, std::vector<double>& t)
{
    for (int i = 0; i < t.size(); ++i)
    {
        if (t[i] < std::floor(t0))
        {
            f[i] = 0;
        }
        else
        {
            f[i] = 1;
        }
    }
}

void gen_kronecker_delta(std::vector<double>& f, double t0, double tau, std::vector<double>& t)
{
    for (int i = 0; i < t.size(); ++i)
    {
        if ((t[i] < std::floor(t0 - tau)) && (t[i] >= std::floor(t0 + tau)))
        {
            f.push_back(0);
        }
        else
        {
            f.push_back(1);
        }
    }
}

void gen_dirac_delta(std::vector<double>& f, double t0, double tau, std::vector<double>& t)
{

    double A = 1.0 / (2 * tau);

    for (int i = 0; i < t.size(); ++i)
    {
        if ((t[i] < std::floor(t0 - tau)) && (t[i] >= std::floor(t0 + tau)))
        {
            f.push_back(0);
        }
        else
        {
            f.push_back(A);
        }
    }
}

void gen_csv_from_samples(std::vector<double>& f, std::vector<double>& t, std::string filename)
{
    std::ofstream fd;
    fd.open(filename);
    for (int i = 0; i < t.size(); ++i)
    {
        fd << t[i] << "," << f[i] << '\n';
    }
    fd.close();
    return;
}

void gen_fourier_square_wave()
{

}

void FIR_filter(double in, double *out, double b[])
{
    static double x[FILTER_TAP_NUM];
    int i;
    double y = 0.0;

    // Shift the input samples in the delay line
    for (i = FILTER_TAP_NUM - 1; i > 0; i--) {
        x[i] = x[i - 1];
        y += b[i] * x[i];
    }

    // Store the most recent input sample
    x[0] = in;

    // Compute the output using the filter coefficients
    y += b[0] * x[0];

    *out = y;
}