
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##   
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##   
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' SIR model on graphs
#' 
#' Run simulations for an SIR (susceptible-infected-recovered) model, on a
#' graph
#' 
#' The SIR model is a simple model from epidemiology. The individuals of the
#' population might be in three states: susceptible, infected and recovered.
#' Recovered people are assumed to be immune to the disease. Susceptibles
#' become infected with a rate that depends on their number of infected
#' neigbors. Infected people become recovered with a constant rate.
#' 
#' The function \code{sir} simulates the model.
#' 
#' Function \code{time_bins} bins the simulation steps, using the
#' Freedman-Diaconis heuristics to determine the bin width.
#' 
#' Function \code{median} and \code{quantile} calculate the median and
#' quantiles of the results, respectively, in bins calculated with
#' \code{time_bins}.
#' 
#' @aliases median.sir quantile.sir time_bins time_bins.sir sir
#' @param graph The graph to run the model on. If directed, then edge
#' directions are ignored and a warning is given.
#' @param beta Non-negative scalar. The rate of infection of an individual that
#' is susceptible and has a single infected neighbor. The infection rate of a
#' susceptible individual with n infected neighbors is n times beta. Formally
#' this is the rate parameter of an exponential distribution.
#' @param gamma Positive scalar. The rate of recovery of an infected
#' individual. Formally, this is the rate parameter of an exponential
#' distribution.
#' @param no.sim Integer scalar, the number simulation runs to perform.
#' @param x A \code{sir} object, returned by the \code{sir} function.
#' @param middle Logical scalar, whether to return the middle of the time bins,
#' or the boundaries.
#' @param na.rm Logical scalar, whether to ignore \code{NA} values.  \code{sir}
#' objects do not contain any \code{NA} values currently, so this argument is
#' effectively ignored.
#' @param comp Character scalar. The component to calculate the quantile of.
#' \code{NI} is infected agents, \code{NS} is susceptibles, \code{NR} stands
#' for recovered.
#' @param prob Numeric vector of probabilities, in [0,1], they specify the
#' quantiles to calculate.
#' @param \dots Additional arguments, ignored currently.
#' @return For \code{sir} the results are returned in an object of class
#' \sQuote{\code{sir}}, which is a list, with one element for each simulation.
#' Each simulation is itself a list with the following elements. They are all
#' numeric vectors, with equal length: \describe{
#'   \item{times}{The times of the events.}
#'   \item{NS}{The number of susceptibles in the population, over time.}
#'   \item{NI}{The number of infected individuals in the population, over
#'     time.}
#'   \item{NR}{The number of recovered individuals in the population, over
#'     time.}
#' } 
#' 
#' Function \code{time_bins} returns a numeric vector, the middle or the
#' boundaries of the time bins, depending on the \code{middle} argument.
#' 
#' \code{median} returns a list of three named numeric vectors, \code{NS},
#' \code{NI} and \code{NR}. The names within the vectors are created from the
#' time bins.
#' 
#' \code{quantile} returns the same vector as \code{median} (but only one, the
#' one requested) if only one quantile is requested. If multiple quantiles are
#' requested, then a list of these vectors is returned, one for each quantile.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}. Eric Kolaczyk
#' (\url{http://math.bu.edu/people/kolaczyk/}) wrote the initial version in R.
#' @seealso \code{\link{plot.sir}} to conveniently plot the results
#' @references Bailey, Norman T. J. (1975). The mathematical theory of
#' infectious diseases and its applications (2nd ed.). London: Griffin.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnm(100, 100)
#' sm <- sir(g, beta=5, gamma=1)
#' plot(sm)
#' @export

sir <- sir
