// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_fall_26

package kirby_fla
{
    import flash.display.MovieClip;

    public dynamic class kirby_fall_26 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var fatfall:*;

        public function kirby_fall_26()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 8, this.frame9);
        }

        internal function frame1():*
        {
            this.fatfall = false;
        }

        internal function frame3():*
        {
            stop();
        }

        internal function frame4():*
        {
            gotoAndStop("back");
        }

        internal function frame5():*
        {
            this.fatfall = true;
        }

        internal function frame9():*
        {
            gotoAndPlay("fatfall");
        }


    }
}//package kirby_fla

