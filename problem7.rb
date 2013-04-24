require 'timeout'

class Problem7

    def do_actions
        #logger = @logger

        #original code
        # logger.info "About to do action1"
        # Timeout::timeout(5) do
        #     begin
        #         action1
        #     rescue => e
        #         logger.error "Got error: #{e.message}"
        #     end
        # end

        # logger.info "About to do action2"
        # Timeout::timeout(10) do
        #     begin
        #         action2
        #     rescue => e
        #         logger.error "Got error: #{e.message}"
        #     end
        # end


        # logger.info "About to do action3"
        # Timeout::timeout(7) do
        #     begin
        #         action3
        #     rescue => e
        #         logger.error "Got error: #{e.message}"
        #     end
        # end

        #refactored code
        do_action("action1", 5){ action1 }
        do_action("action2", 10){ action2 }
        do_action("action3", 7){ action3 }
    end

    #The block helper used for refactoring
    def do_action(name, timeout)
        logger = @logger
        logger.info "About to do #{name}"
        begin
            Timeout::timeout(timeout) do
                yield
            end
        rescue => e
            logger.error "Got error: #{e.message}"
        end
    end

    def action1
        sleep(@action_delays[0])
    end

    def action2
        sleep(@action_delays[1])
    end

    def action3
        sleep(@action_delays[2])
    end

    def initialize(delay1, delay2, delay3)
        @logger = Logger.new
        @action_delays = [delay1, delay2, delay3]
    end

    def info_log
        return @logger.info_log
    end

    def error_log
        return @logger.error_log
    end
end

class Logger
    attr_reader :info_log, :error_log

    def initialize
        @info_log = ""
        @error_log = ""
    end

    def info(entry)
        @info_log += entry
    end

    def error(entry)
        @error_log += entry
    end
end

class Problem7Tester < Problem7
    attr_reader :has_performed

    def initialize(delay1, delay2, delay3)
        super(delay1, delay2, delay3)
        @has_performed = {action1: false, action2: false, action3: false}
    end

    def action1
        super
        @has_performed[:action1] = true
    end

    def action2
        super
        @has_performed[:action2] = true
    end

    def action3
        super
        @has_performed[:action3] = true
    end
end