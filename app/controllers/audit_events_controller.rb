class AuditEventsController < ApplicationController
    before_action :get_election

    def index
        @audit_events = @election.audit_events
    end

    private
        def get_election
            @election = Election.find(params[:election_id])
        end
end
