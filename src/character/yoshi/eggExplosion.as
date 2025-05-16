// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//eggExplosion

package 
{
    import flash.display.MovieClip;

    public dynamic class eggExplosion extends MovieClip 
    {

        public function eggExplosion()
        {
            addFrameScript(0, this.frame1, 8, this.frame9);
        }

        internal function frame1():*
        {
            this.scaleX = 1.5;
            this.scaleY = 1.5;
        }

        internal function frame9():*
        {
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

