// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//supersonic_debris

package 
{
    import flash.display.MovieClip;

    public dynamic class supersonic_debris extends MovieClip 
    {

        public function supersonic_debris()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

