class EntitlementsController < ApplicationController
  def index
    entitlements
  end

  def search
    return redirect_to action: 'index' unless request.xhr? && entitlement_search.valid?
    return render plain: '', status: :not_found unless entitlement_search.result

    render partial: 'entitlements/entitlements_table', locals: { entitlement: entitlement_search.result }
  end

  def show
    entitlement
  end

  private

  def entitlement
    @entitlement ||= Entitlement.find(params[:id])
  end

  def entitlement_search
    @entitlement_search ||= EntitlementSearch.new(params)
  end

  def entitlements
    @entitlements ||= Entitlement.all
  end
end