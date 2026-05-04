using GLMakie

function main()
    # Criamos a "Janela" (Figura) e o "Grid" (Eixo)
    fig = Figure()
    ax = Axis(fig[1, 1], title = "Simulação em Tempo Real", 
              aspect = DataAspect(), limits = (-10, 10, -10, 10))
    
    # Criamos um ponto "observável" (ele pode mudar e a tela atualiza sozinha)
    ponto_pos = Observable(Point2f(0, 0))
    
    # Desenha a bola na janela
    scatter!(ax, ponto_pos, color = :red, markersize = 20)
    
    display(fig) # Abre a janela no seu Windows (via WSL)

    # Loop da simulação
    for t in 0:0.1:10
        # Atualiza a posição da bola
        ponto_pos[] = Point2f(t - 5, sin(t))
        
        sleep(0.01) # Pequena pausa para nossos olhos acompanharem
    end
    
end

main()