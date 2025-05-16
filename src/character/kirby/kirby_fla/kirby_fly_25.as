// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_fly_25

package kirby_fla
{
    import flash.display.MovieClip;

    public dynamic class kirby_fly_25 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function kirby_fly_25()
        {
            addFrameScript(32, this.frame33);
        }

        internal function frame33():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package kirby_fla

