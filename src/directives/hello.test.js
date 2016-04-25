export default ngModule => {
	describe('hello', () => {
		beforeEach(window.module(ngModule.name));

		it('should test properly', () => {
			expect(false).toBe(true);
		});
	});
};