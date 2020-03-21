library(BoolNet)


# Ex. 1 

network = loadNetwork("/Users/wassilyminkow/Desktop/mynetwork.txt")
plotNetworkWiring(network)


# Ex. 2

markovSimulation(network, 500)
# There is no zero-probabilities after these iterations.

# Ex. 3

atr = getAttractors(network)
plotStateGraph(atr)
par(mfrow=c(1, 2))
plotAttractors(atr)
# One attractor is stady-state and another is multi-state cycle. 
# There is no zero-probabilities after markov simulation, so any 
# transition is possible.

state.list = c(1, 1, 1, 1, 1, 1, 1, 1, 1)

# synchronous

getAttractors(network, 
              type = "synchronous", 
              method = "chosen", 
              startStates = list(state.list))

getPathToAttractor(network, state = state.list)
plotSequence(network, startState = state.list)

# asynchronous

getAttractors(network, 
              type = "asynchronous", 
              method = "chosen", 
              startStates = list(state.list))

getPathToAttractor(network, state = state.list)
plotSequence(network, startState = state.list)

# In both cases the are three more states added until reaching the attractor state.

# Ex. 4

network_new = fixGenes(network, fixIndices = c("MBF", "CLN3"), values = c(1, 0))

state.list = c(1, 1, 1, 1, 1, 1, 1, 1, 1)

atr = getAttractors(network_new, 
              type = "synchronous", 
              )
plotAttractors(atr)

# As it was stated, the MBF gene is allways expressed in attractor state 
# and CNL3 one is never expressed. However due to being related to MBF, YHP1 is 
# also expressed all the time. 


