component {
	
	property name="filters";
	
	public FilterBuilder function init(){
		variables.filters = [];
		return this;
	}

	public function add(required any filter){
		arrayAppend(getFilters(), arguments.filter);
		return this;
	}

	public function onMissingMethod(required string MissingMethodName, required array MissingMethodArguments){
		if(findNoCase("filter", arguments.MissingMethodName)){
			local.filter = createObject("component", "#arguments.MissingMethodName#").init(argumentCollection=MissingMethodArguments);
			add(local.filter);
			return local.filter;
		}
	}
}