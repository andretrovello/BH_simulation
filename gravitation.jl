# Code for simulating the orbit of a planet around a star
# using Newtonian Physics

# Importing packages
using GLMakie, StaticArrays, LinearAlgebra

# Create struct (class) for mover (planet) and attractor (star)
mutable struct Mover # Orbiting planet
    # Stores position, velocity and mass 
    position::SVector{2, Float64} 
    velocity::SVector{2, Float64}
    mass::Float64
end

struct Attractor # Center star
    # Stores position and mass
    position::SVector{2, Float64} 
    mass::Float64
end

# Calculate Gravitational Force
function Gforce(G, star, planet)
    r_vector = star.position - planet.position
    r_norm = norm(r_vector)
    
    # Gravitational Force in vector format
    # F = G*M*m * r_vec / r_norm^3
    force = (G * star.mass * planet.mass) * r_vector / (r_norm^3)
    return force
end

# Update simulation Physics (GForce, acceleration, velocity and position)
function atualizar_fisica!(planet, star, G, dt)
    # Calculate GForce and acceleration at current moment
    F = Gforce(G, star, planet)
    a = F / planet.mass

    # Update velocity (v = v + a*dt)
    planet.velocity = planet.velocity + a * dt

    # Update position (s = s + v*dt)
    planet.position = planet.position + planet.velocity * dt
end

# Main function
function main()
    
# Creates figure axis and grid 
    fig = Figure(resolution = (800, 800))
    ax = Axis(fig[1, 1], title = "Newtonian Simulation: 2-body problem", 
              aspect = DataAspect(), limits = (-20, 20, -20, 20))
    
    # Initial parameters
    G = 1.0
    dt = 0.05
    
    # Star initial conditions
    star = Attractor(SA[0.0, 0.0], 100.0)
    # Planet initial conditions
    planet = Mover(SA[15.0, 0.0], SA[0.0, 2.5], 1.0)

    # Observables for GLMakie (updates screen)
    star_pos = Observable(Point2f(star.position))
    planet_pos = Observable(Point2f(planet.position))

    # Draws bodies on screen
    scatter!(ax, star_pos, color = :orange, markersize = 40, label = "Star")
    scatter!(ax, planet_pos, color = :blue, markersize = 15, label = "Planet")
    
    display(fig)

    # Simulation loop beginning
    println("Running Simulation... Close window to stop.")

    while true
        atualizar_fisica!(planet,star,G,dt) # Update physics
        planet_pos[] = Point2f(planet.position) # Update planet position on screen
        
        # Animation speed
        sleep(0.01)
    end
end

main()