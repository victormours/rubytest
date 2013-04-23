require 'timeout'

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

class Problem7

    def initialize
        @logger = Logger.new
        @action1_performed = false
        @action2_performed = false
        @action3_performed = false
    end

    def info_log
        return @logger.info_log
    end

    def error_log
        return @logger.error_log
    end

    def action1
        @action1_performed = true
    end

    def action2
        @action2_performed = true
    end

    def action3
        @action3_performed = true
    end

    def all_actions_performed?
        return @action1_performed && @action2_performed && @action3_performed
    end

    def do_actions
        logger = @logger

        #original code
        logger.info "About to do action1"
        Timeout::timeout(5) do
            begin
                action1
            rescue => e
                logger.error "Got error: #{e.message}"
            end
        end

        logger.info "About to do action2"
        Timeout::timeout(10) do
            begin
                action2
            rescue => e
                logger.error "Got error: #{e.message}"
            end
        end

        logger.info "About to do action3"
        Timeout::timeout(7) do
            begin
                action3
            rescue => e
                logger.error "Got error: #{e.message}"
            end
        end

    end

end
