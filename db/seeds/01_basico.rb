# encoding: utf-8

user_admin = User.create! :email     => 'admin@localhost.org',
                          :cpf       => '82195315504',
                          :firstname => 'Administrador',
                          :lastname  => 'Mapa da Cultura',
                          :password  => '123456789',
                          :password_confirmation => '123456789',
                          :admin => true

tipo_pessoa_fisica = Tipo.create! :nome => 'Pessoa Física',
                                  :descricao => 'Pessoa Física'

tipo_equipamento = Tipo.create! :nome => 'Equipamento',
                                :descricao => 'Equipamento'

tipo_grupo_formalizado = Tipo.create! :nome => 'Grupo Formalizado',
                                      :descricao => 'Grupo Formalizado'

tipo_grupo_nao_formalizado = Tipo.create! :nome => 'Grupo Não Formalizado',
                                          :descricao => 'Grupo Não Formalizado'

tipo_natureza = TipoNatureza.create! :nome => 'Privado Sem Fins Lucrativos'
tipo_natureza = TipoNatureza.create! :nome => 'Privado Com Fins Lucrativos'
tipo_natureza = TipoNatureza.create! :nome => 'Público'
tipo_natureza = TipoNatureza.create! :nome => 'Artista'
tipo_natureza = TipoNatureza.create! :nome => 'Gestor Público'
tipo_natureza = TipoNatureza.create! :nome => 'Trabalhador (Outros)'
tipo_natureza = TipoNatureza.create! :nome => 'Pesquisador'
tipo_natureza = TipoNatureza.create! :nome => 'Consultor'

atividade_hip_hop = Atividade.create! :nome => 'Hip-Hop',
                                      :descricao => 'Hip-Hop',
                                      :imagem => File.open('db/imagens/Atividade_HipHop.png')

atividade_cultura_popular = Atividade.create! :nome => 'Cultura Popular e Tradicional',
                                              :descricao => 'Cultura Popular e Tradicional',
                                              :imagem => File.open('db/imagens/Atividade_CulturaPopular.png')

atividade_teatro = Atividade.create! :nome => 'Teatro',
                                     :descricao => 'Teatro',
                                     :imagem => File.open('db/imagens/Atividade_Teatro.png')

atividade_musica = Atividade.create! :nome => 'Música',
                                     :descricao => 'Música',
                                     :imagem => File.open('db/imagens/Atividade_Musica.png')

atividade_audiovisual = Atividade.create! :nome => 'Audiovisual',
                                          :descricao => 'Audiovisual',
                                          :imagem => File.open('db/imagens/Atividade_Audiovisual.png')

atividade_artesanato = Atividade.create! :nome => 'Artesanato e Artes Plásticas',
                                         :descricao => 'Artesanato e Artes Plásticas',
                                         :imagem => File.open('db/imagens/Atividade_Artesanato.png')

atividade_gestao = Atividade.create! :nome => 'Gestão e Pesquisa',
                                     :descricao => 'Gestão e Pesquisa',
                                     :imagem => File.open('db/imagens/Atividade_Realizacao.png')

atividade_producao = Atividade.create! :nome => 'Produção',
                                       :descricao => 'Produção',
                                       :imagem => File.open('db/imagens/Atividade_Producao.png')

atividade_circo = Atividade.create! :nome => 'Circo',
                                    :descricao => 'Circo',
                                    :imagem => File.open('db/imagens/Atividade_Circo.png')

atividade_educacao = Atividade.create! :nome => 'Educação, Direitos Humanos e Cultura de Paz',
                                       :descricao => 'Educação, Direitos Humanos e Cultura de Paz',
                                       :imagem => File.open('db/imagens/Atividade_Educacao.png')

atividade_saude = Atividade.create! :nome => 'Saúde e Cultura',
                                    :descricao => 'Saúde e Cultura',
                                    :imagem => File.open('db/imagens/Atividade_Saude.png')

atividade_meio_ambiente = Atividade.create! :nome => 'Meio Ambiente e Cultura',
                                            :descricao => 'Meio Ambiente e Cultura',
                                            :imagem => File.open('db/imagens/Atividade_Meio_Ambiente.png')

atividade_software_livre = Atividade.create! :nome => 'Software Livre',
                                             :descricao => 'Software Livre',
                                             :imagem => File.open('db/imagens/Atividade_Software_Livre.png')

atividade_radio = Atividade.create! :nome => 'Rádio',
                                    :descricao => 'Rádio',
                                    :imagem => File.open('db/imagens/Atividade_Radio.png')

atividade_tv = Atividade.create! :nome => 'TV',
                                 :descricao => 'TV',
                                 :imagem => File.open('db/imagens/Atividade_TV.png')

tipo_equipamento_teatro = TipoEquipamento.create! :nome => 'Teatro',
                                                  :descricao => 'Teatro',
                                                  :imagem    => File.open('db/imagens/Atividade_Teatro.png')

tipo_equipamento_cinema = TipoEquipamento.create! :nome => 'Cinema',
                                                  :descricao => 'Cinema',
                                                  :imagem    => File.open('db/imagens/Atividade_Audiovisual.png')

tipo_equipamento_biblioteca = TipoEquipamento.create! :nome => 'Biblioteca',
                                                      :descricao => 'Biblioteca',
                                                      :imagem    => File.open('db/imagens/Tipo_Equipamento_Biblioteca.png')

tipo_equipamento_museu = TipoEquipamento.create! :nome => 'Museu',
                                                 :descricao => 'Museu',
                                                 :imagem    => File.open('db/imagens/Tipo_Equipamento_Museu.png')

tipo_equipamento_show = TipoEquipamento.create! :nome => 'Show e Apresentações Musicais',
                                                :descricao => 'Show e Apresentações Musicais',
                                                :imagem    => File.open('db/imagens/Atividade_Musica.png')

tipo_equipamento_espacocultural = TipoEquipamento.create! :nome => 'Espaço Cultural',
                                                          :descricao => 'Espaço Cultural',
                                                          :imagem    => File.open('db/imagens/Tipo_Equipamento_EspacoCultural.png')


tipo_equipamento_centrosesportivos = TipoEquipamento.create! :nome => 'Centros Esportivos',
                                                             :descricao => 'Centros Esportivos',
                                                             :imagem    => File.open('db/imagens/Tipo_Equipamento_CentrosEsportivos.png')

tipo_equipamento_auditorios = TipoEquipamento.create! :nome => 'Auditórios e Salões Comunitários',
                                                      :descricao => 'Auditórios e Salões Comunitários',
                                                      :imagem    => File.open('db/imagens/Tipo_Equipamento_Auditorios.png')

tipo_referencia_cultural = TipoEquipamento.create! :nome => 'Refêrencia Cultural para sua Comunidade',
                                                   :descricao => 'Refêrencia Cultural para sua Comunidade',
                                                   :imagem    => File.open('db/imagens/Tipo_Equipamento_Referencia.png')
