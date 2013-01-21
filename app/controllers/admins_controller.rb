class AdminsController < AuthenticatedController
 before_filter :require_admin
end
