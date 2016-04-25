export default ngModule => {

	ngModule.directive('hello', () => {
		require('./hello.styl');
		return {
			restrict: 'E',
			scope: {},
			template: require('./hello.html'),
			controllerAs: 'vm',
			controller: function(){
				const vm = this;

				vm.greeting = 'Hello';
			}
		};
	});	
};