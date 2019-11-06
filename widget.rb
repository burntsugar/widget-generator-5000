module WidgetGenerator

    #
    # WidgetGenerator 5000
    # rachael.colley@coderacademy.edu.au
    #

    class Widget
        
        attr_reader :id
        attr_accessor :name
        attr_accessor :description
        attr_accessor :lengthcms
        attr_accessor :widthcms
        attr_accessor :heightcms
        attr_accessor :weightgms
        attr_accessor :valueaud

        def initialize(id,
            name,
            description,
            lengthcms,
            widthcms,
            heightcms,
            weightgms,
            valueaud)

            @id = id
            @name = name
            @description = description
            @lengthcms = lengthcms
            @widthcms = widthcms
            @heightcms = heightcms
            @weightgms = weightgms
            @valueaud = valueaud
        end

        # Object string rep.
        def to_s
            "id: #{id}, name: #{@name}, description: #{@description}, lengthcms: #{@lengthcms}, widthcms: #{@widthcms}, heightcms: #{@heightcms}, weightgms: #{@weightgms}, valueaud: #{@valueaud.round(2)}"
        end

        # Object json rep.
        def to_jzon
            str = "{"
            instance_variables.each { |var| 
                str += enclose_in_quotes(var.to_s.delete("@"))
                    str += ':'
                if (var == :@valueaud)
                    str += enclose_in_quotes(instance_variable_get(var).round(2).to_s)
                else
                    str += enclose_in_quotes(instance_variable_get(var).to_s)
                end
                str += ','
            }
            str.delete_suffix!(",")
            str += "}"
        end

        # Object hash rep.
        def to_hash
            hash = {}
            instance_variables.each { |var| 
                if (var == :@valueaud)
                    hash[var.to_s.delete("@")] = instance_variable_get(var).round(2)
                else
                    hash[var.to_s.delete("@")] = instance_variable_get(var) 
                end
            }
            hash
        end

        private 

        def enclose_in_quotes(str)
            '"' + str + '"'
        end

    end

    class WidgetManager
        ## 
        # generates 100 widgets to tool around with...
        #
        def self.generate_widgets
            initialise_widgets
        end

        private
        ##
        # Initialise 100 widgets to tool around with...
        #
        RANDOM_MAX_LENGTH_CMS = 100
        RANDOM_MAX_WIDTH_CMS = 50
        RANDOM_MAX_HEIGHT_CMS = 25
        RANDOM_MAX_WEIGHT_GMS = 5
        RANDOM_MAX_VALUE_AUD = 9.0

        def self.initialise_widgets
            @warr = Array.new

            adjectives = ["hairless","metal","wild","domesticated","abnormal","medicated","massive","impressive","out of control","internet worthy","hilarious","hot","very tactful","bearded","duck-like","slimy","insanely creepy","embarrassed to the bone","self-centered","talking","shaky","deep","sick","zippy","sticky","fluffy","frozen","unholy","painfully honest","bonkers","harsh","greedy","crawly","insane","hideous","twisted","useless","yapping","magical","indecent","arrogant","confused","flirting","high-end","insecure","maniacal","sickened","slippery","stubborn","tripping","costumed","cowardly","haunting","startled","generous","demanding","shivering","nighttime","startling","slap happy","blathering","flickering","rebellious","impertinent","bull headed","hyperactive","outnumbered","territorial","zombie like","mischievous","at-the-ready","house-broken","up-to-no-good","misunderstood","fiercely-loyal","out-of-control","fear-inspiring","intelligent","responsible","reasonable","historical","additional","traditional","unlikely","obviously","competitive","automatic","significant","electronic","electrical","available","difficult","obvious","impressive","confident","informal","every","unable","consistent","expensive","financial","practical","critical","terrible","realistic","efficient","various","relevant","suitable","popular","powerful","lonely","conscious","curious","technical","careful","different","glorious","capable","unhappy","medical","happy","immediate","wonderful","existing","federal","accurate","important","anxious","desperate","visible","afraid","sorry","actual","boring","aware","wooden","angry","recent","pleasant","legal","inner","happy","lucky","basic","latter","mental","southern","civil","ugly","decent","global","tiny","healthy","united","hungry","unfair","content","pleased","cheerful","jovial","jolly","glad","thrilled","elated","gleeful","sunny","absurd","amusing","droll","entertaining","hilarious","ludicrous","playful","ridiculous","silly","whimsical","antic","gas","gay","humdinger","jolly","rich","riot","screaming","slapstick","blithe","capricious","clever","diverting","facetious","farcical","for grins","gelastic","good-humored","hysterical","jocose","jocular","joking","knee-slapper","laughable","merry","mirthful","priceless","riotous","risible","side-splitting","sportive","waggish","witty"]
            
            name_count = 1
            100.times {
                id = name_count
                name = "widget#{name_count}"
                description = adjectives[make_random_num(adjectives.length-1)]
                lengthcm = make_random_num(RANDOM_MAX_LENGTH_CMS)
                widthcm = make_random_num(RANDOM_MAX_WIDTH_CMS)
                heightcm = make_random_num(RANDOM_MAX_HEIGHT_CMS)
                weightgms = make_random_num(RANDOM_MAX_WEIGHT_GMS)
                valueaud = make_random_num(RANDOM_MAX_VALUE_AUD).to_f

                @warr << Widget.new(id,
                    name,
                    description,
                    lengthcm,
                    widthcm,
                    heightcm,
                    weightgms,
                    valueaud)

                name_count+=1
            }
            @warr
        end

        def self.make_random_num(max_inclusive)
            r = Random.new
            r.rand(max_inclusive + 1)
        end

    end
    
end