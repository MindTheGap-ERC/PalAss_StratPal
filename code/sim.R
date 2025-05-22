library(admtools)
library(StratPal)


dist = "12km"
adm = tp_to_adm(t = scenarioA$t_myr,
                h = scenarioA$h_m[, dist],
                T_unit = "Myr",
                L_unit = "m")

plot(adm)
T_axis_lab()
L_axis_lab()

t_increment = 0.01
seq(from = min_time(adm), to = max_time(adm), by = t_increment) |> 
  random_walk(sigma = 1, mu = 3) |>                                 # simulate random walk
  time_to_strat(adm, destructive = FALSE) |>                    # transform data from time to strat domain
  plot(type = "l",                                                  # plot
       orientation = "lr",
       xlab = paste0("Stratigraphic height [", get_L_unit(adm), "]"),
       ylab = "Trait value",
       main = "Trait evolution 12 km from shore")
